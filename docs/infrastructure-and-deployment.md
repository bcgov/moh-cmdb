# Infrastructure and deployment

How CMDB runs on AWS (LZA) and how it is deployed. See [developer-notes.md](developer-notes.md) for some not very obvious findings about this repo.

**Terms:** ASEA = the old servers. LZA = the new AWS landing zone this project now runs in.

## 1. Where to read more

Full write-ups are on Confluence: [CMDB LZA Migration & Upgrade](https://hlth.atlassian.net/wiki/spaces/HA/pages/1154744568/CMDB+LZA+Migration+Upgrade).
Its child pages cover:

- AWS-GitHub authentication configuration
- CMDB 3.4.1 to 4.2 upgrade
- LZA DB backups, snapshots and CloudWatch
- ZAP scan
- LZA CloudFront and load balancer Terraform setup
- Patching, monitoring and alerts (developer guide)
  
- [CMDB - Restoring EC2 Instance from Backup](https://hlth.atlassian.net/wiki/spaces/HA/pages/1176043613/CMDB+-+Restoring+EC2+Instance+from+Backup)

This repo holds the Terraform behind those pages. Start here for the shape, go to Confluence for the detail.

## 2. What runs where

CMDBuild 4.2 runs on **one EC2 instance** (Tomcat 10, Java 17) with a **PostgreSQL 17 RDS database**.
There are two environments, **test** and **prod**, each its own AWS account with its own copy of everything below.

| | Test | Prod |
|---|---|---|
| URL | `cmdbt.hlth.gov.bc.ca` | `cmdb.hlth.gov.bc.ca` |
| CMDBuild path / config folder | `/cmdbuildTest/` | `/cmdbuildProd/` |
| Java heap | Java default | 2 GB start, 4 GB max |
| Patch delay (bugfix / security) | 7 / 3 days | 14 / 7 days |
| Tomcat install dir | `/u01/tomcat` | `/u01/tomcat` |

## 3. How a request reaches the app

```text
  User
   |  HTTPS
   v
+---------------------------+
| CloudFront                |  security headers, no caching
+---------------------------+
   |
   v
+---------------------------+
| API Gateway (HTTP API)    |  rewrites the Host header
+---------------------------+
   |  VPC Link
   v
+---------------------------+
| Shared ALB                |  host-header rule picks this app
+---------------------------+
   |
   v
+---------------------------+
| EC2: Tomcat + CMDBuild    |
+---------------------------+
   |  port 5432
   v
+---------------------------+
| RDS PostgreSQL 17         |
+---------------------------+
```

- The DNS name for each environment must point at the **CloudFront** domain (Terraform output `cloudfront_domain_name`).
  The TLS certificate for that name must already exist in ACM in `us-east-1`.
- API Gateway has no custom domain. It rewrites the `Host` header so the shared ALB's rule matches.
- The ALB is the account's pre-built shared one. This project only adds its own rules and target group.
  A rule redirects the bare `/` to `/cmdbuild<Env>/`.
- The ALB health check calls `/cmdbuild<Env>/`.

## 4. What Terraform builds, and what it does not

| Built by Terraform | File |
|---|---|
| CloudFront, security headers (HSTS, CSP) | `cloudfront.tf` |
| API Gateway and VPC Link | `apigateway.tf` |
| ALB rules, target group | `alb.tf` |
| EC2 instance and its first-boot script | `ec2.tf`, `user_data.sh` |
| RDS PostgreSQL, DB password in Secrets Manager | `rds.tf`, `secretmanager.tf` |
| Daily EBS snapshots (7 kept) | `snapshots.tf` |
| Nightly OS patching through SSM, with snapshot check first | `patching.tf` |
| CloudWatch alarms and email alerts (SNS) | `cloudwatch-alarms.tf`, `sns.tf` |
| Network lookups (VPC, subnets, security groups) | `network.tf` |

**Not built by Terraform (done by hand):**

- The VPC, subnets, security groups and shared ALB already exist. Terraform only looks them up by name and tag.
- The S3 bucket `<account-id>-tomcat` holds the Tomcat tarball and the CMDBuild WAR for first boot.
  It is created by Terraform, but you upload the files.
- CMDBuild's config files in `/u01/tomcat/conf/cmdbuild<Env>/` (such as `database.conf`) are put there by hand.
- CMDBuild's own settings, including the OAuth login, live in its database and are set in the admin UI.

## 5. Database (RDS) and secrets

**Database:** one PostgreSQL 17.11 RDS instance per environment (`cmdb-test`, `cmdb-prod`), database name `cmdb`,
port 5432, instance class `db.t3.micro`. It sits in the Data subnets behind the account's Data security group.

| Setting | Value |
|---|---|
| Storage | Prod 20 GB, test 10 GB (default). Can be increased, never decreased. |
| Automated backups | Kept 7 days, window 03:00 to 06:00 |
| Maintenance window | Monday 00:00 to 03:00 |
| Monitoring | Enhanced monitoring every 30 seconds |
| Deletion protection | Not enabled (the setting is commented out in `rds.tf`) |
| Alarms | CPU, connections, disk queue depth and free storage (`cloudwatch-alarms.tf`) |

**Secrets (AWS Secrets Manager):** two secrets per environment.

| Secret | Contains | Notes |
|---|---|---|
| `cmdb-master-creds-<two random words>` | Master username (`postgres`) and the generated master password | The password is created by Terraform and used by RDS. The name comes from a random generator, so it changes if that resource is ever recreated. |
| `CMDB_PG_USER` | Username, password, host, port and db name | Manual backup only. The password is created as the placeholder `changeme`; it is not read by Tomcat or Terraform. A backup also lives in the Mid-Tier KeePass. |

Terraform ignores later changes to the secret values, so edits made in AWS are kept but are not tracked by Terraform.
The application's own connection details are not in either secret. They are in `database.conf`, set by hand
(see section 6).

## 6. Tomcat and CMDBuild on the EC2 instance

`user_data.sh` runs once, as root, when the instance is first created. The output is in
`/var/log/cloud-init-output.log`. It does the following:

- Installs Amazon Corretto 17.
- Downloads `apache-tomcat-<version>.tar.gz` (default 10.1.60) from the `<account-id>-tomcat` S3 bucket and unpacks it to
  `/u01/tomcat`.
- Downloads the CMDBuild WAR (default `cmdbuild-4.2.0.war`) from the same bucket to
  `/u01/tomcat/webapps/cmdbuild<Env>.war`. If the download fails, Tomcat is still set up and CMDBuild must be deployed by hand.
- Writes `bin/setenv.sh` with the Java options (`catalina_opts`) only if that value is set. Prod sets `-Xms2048m -Xmx4096m`.
- Creates the `tomcat` user, owns `/u01/tomcat`, and makes it group-writable.
- Allows the `tomcat` user to run only `systemctl start|stop|restart tomcat` with sudo.
- Installs and starts a `tomcat` systemd service that starts on boot and restarts on failure.

| Item | Value |
|---|---|
| Install directory | `/u01/tomcat` |
| Port | 8080 |
| CMDBuild URL path | `/cmdbuildTest/` (test), `/cmdbuildProd/` (prod) |
| CMDBuild config folder | `/u01/tomcat/conf/cmdbuild<Env>/` |
| Files to upload to S3 before first boot | The Tomcat tarball and the CMDBuild WAR |
| Access to the server | AWS Systems Manager Session Manager (SSM). The instance role also has read access to the S3 bucket. |

CMDBuild does not work until its config files (such as `database.conf`) are added by hand to the config folder.
After the first Session Manager login, add `ssm-user` to the `tomcat` group by hand
(`sudo usermod -aG tomcat ssm-user`) to edit files there.

## 7. Things that will surprise you

- **The EC2 instance ignores changes** to its image and to `user_data.sh`. Editing the script only affects a
  newly created instance. This is deliberate, so an Amazon image update does not wipe the hand-installed app.
- **Tomcat is a service.** Use `sudo systemctl start|stop|restart tomcat`, not `startup.sh`.
- **Nightly patching installs and reboots** on both environments. It stops Tomcat first, needs that day's snapshot to
  exist, and mutes the unhealthy-host alarms for an hour. Failures email the `alert_emails` list.
- **Login is OAuth through Keycloak**, not IDIR directly. See the Authentication section in [developer-notes.md](developer-notes.md).

## 8. Deploying

Deploys are manual. The GitHub Action `AWS Deploy` (`.github/workflows/aws-deploy.yml`) only runs when someone
starts it from the Actions tab (`workflow_dispatch`). Nothing deploys on push or on a pull request.

### Workflow inputs

| Input | Meaning |
|---|---|
| Use workflow from (branch) | The branch whose code is checked out and planned. This can be a feature branch. |
| `environment` | `test` or `prod`. Selects the `Terraform/<env>/` folder and the GitHub environment of the same name. |
| `plan_only` | Ticked by default: plan only. Untick to apply as well. |
| `unlock_id` | Leave blank. Only fill it in to force-unlock a stale state lock before the run. |
| `version` | Optional, not used by any step. |

Runs for the same environment queue one at a time. The workflow signs in to AWS with an OIDC role
(`TERRAFORM_DEPLOY_ROLE_ARN`).

### Steps for a change (deployment)

1. Create a feature branch from `main`.
2. Make the change in `Infrastructure/`, or in the `terragrunt.hcl` of `Terraform/test/` or `Terraform/prod/` for environment values.
3. Run AWS Deploy from your branch with `plan_only` ticked, and check the plan shows only what you expect.
4. Open a pull request into `main` and merge it after review.
5. Run AWS Deploy from `main` with `plan_only` unticked to apply.
6. Repeat for the other environment, then check the site and the alert emails.
7. For a major change (for example a CMDBuild, Tomcat or PostgreSQL major upgrade, or a move to a new account), tag the
   release once PROD is deployed and checked. Check the latest tag first and increase it from there. Tag the merge commit on
   `main` (the commit that was deployed) and push the tag.