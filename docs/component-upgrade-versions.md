# Component versions and upgrade rules

Use this to decide whether upgrading one component also means upgrading others.
Please re-check the sources below before planning an upgrade.

## What runs today

| Component | Version | Installed by |
|---|---|---|
| CMDBuild | 4.2.0 (`cmdbuild-4.2.0.war`) | Deployed by `Infrastructure/user_data.sh` from the `<account-id>-tomcat` S3 bucket |
| Apache Tomcat | 10.1.60 | Tarball from the same S3 bucket, unpacked to `/u01/tomcat` |
| Java | Amazon Corretto 17 | `yum install java-17-amazon-corretto` at first boot |
| PostgreSQL | 17.11 | RDS, set by `postgres_engine_version` in each `Terraform/<env>/terragrunt.hcl` |
| OS | Amazon Linux 2023 | AMI pinned in `Infrastructure/ec2.tf` |

## What the vendors require

| Component | CMDBuild 4.2 (what we run) | CMDBuild 4.3 (latest) |
|---|---|---|
| Java | 17 | 25 |
| Tomcat | 10.x or later (recommended 10.1.52) | 11.x or later (recommended 11.0.26) |
| PostgreSQL | 12 through 17 (17 recommended) | 17.x |
| RAM | At least 16 GB | At least 24 GB (32 GB recommended) |

Tomcat's own requirements for Java:

| Tomcat line | Servlet API | Minimum Java |
|---|---|---|
| 10.1.x | 6.0 | 11 |
| 11.0.x | 6.1 | 17 |

CMDBuild 4.2 is marked "no longer actively maintained" on its documentation site.


## Upgrade rules

| Change | Moves alone? | Notes |
|---|---|---|
| Java patch update within 17 (17.0.x) | Yes | Within the same major version. Nightly OS patching does this; see "What patching covers". |
| Java 17 to a newer major (21, 25) | **No, not on CMDBuild 4.2** | CMDBuild 4.2 states Java 17. A newer Java is outside the vendor's stated support until CMDBuild itself moves. |
| Tomcat patch update within 10.1.x | Yes | Safe within CMDBuild 4.2. Applied by hand. |
| Tomcat 10.1 to 11 | **Not confirmed** | CMDBuild 4.2 says "10.x or later" (recommended 10.1.52) but does not say 11 was tested with it. Tomcat 11 needs Java 17 or later, which we have. CMDBuild 4.3 requires 11. Treat it as part of the CMDBuild upgrade unless CMDBuild confirms 4.2 on Tomcat 11. |
| PostgreSQL minor update (17.x) | Yes | Within the range CMDBuild supports. |
| PostgreSQL major version | **No** | 17 is the highest version either CMDBuild release supports. |
| CMDBuild 4.2 to 4.3 | **All together** | Needs Java 25, Tomcat 11 and a larger instance (RAM minimum above), with PostgreSQL 17 unchanged. |

In short: while CMDBuild stays on 4.2, only patch-level updates are confirmed for Java, Tomcat and PostgreSQL. A major
move of any of them should be treated as part of a CMDBuild upgrade. If Java and Tomcat both need to move, check that the current
Tomcat supports the new Java first. Usually Java goes first, then Tomcat.

## What patching covers

- **Nightly OS patching** (SSM, `Infrastructure/patching.tf`) updates operating system packages. For Java it only
  moves within the same major version, such as 17.0.x. Run `dnf list installed | grep corretto` on the server to see
  which version is installed.
- **Tomcat and CMDBuild are not covered by OS patching.** They are a tarball and a WAR file, so updates to them are
  manual. Tomcat security fixes need to be applied by hand.
- **PostgreSQL** is managed by RDS. Its maintenance window is Monday 00:00 to 03:00. Automatic minor
  version upgrades are on (the setting is not overridden in `rds.tf`, and the Terraform module defaults it to on), so
  RDS applies new 17.x minor versions during that window. A major version change only happens when someone changes
  `postgres_engine_version` in `Terraform/<env>/terragrunt.hcl`.

## Where to find the information

| Topic | Source |
|---|---|
| CMDBuild 4.2 requirements | [docs.cmdbuild.org/docs/4.2/technical/system-configuration](https://docs.cmdbuild.org/docs/4.2/technical/system-configuration) |
| CMDBuild latest requirements | [docs.cmdbuild.org/docs/technical/system-configuration](https://docs.cmdbuild.org/docs/technical/system-configuration) and the [download page](https://cmdbuild.org/en/download/latest-version) |
| CMDBuild version update steps | [docs.cmdbuild.org/docs/4.2/technical/cmdbuild-version-update](https://docs.cmdbuild.org/docs/4.2/technical/cmdbuild-version-update) |
| Tomcat versions and Java minimums | [tomcat.apache.org/whichversion.html](https://tomcat.apache.org/whichversion.html) |
| Corretto versions and support dates | [aws.amazon.com/corretto/faqs](https://aws.amazon.com/corretto/faqs) |
| CMDBuild changelog (may hold upgrade notes) | [github.com/Pat-srl/cmdbuild CHANGELOG.md](https://github.com/Pat-srl/cmdbuild/blob/main/CHANGELOG.md), not yet read |

The CMDBuild docs site has a version selector. Make sure you read the page for the version you run, because the
requirements differ between 4.2 and 4.3.

## Not yet checked

- A documented upgrade path from CMDBuild 4.2 to 4.3, and whether it needs database changes.
- Whether Corretto 25 is available as a package for Amazon Linux 2023.
- Corretto 17 end-of-support date. One source gave October 2029; confirm it on the English AWS page.

---

---

# Suggestion: CMDBuild going forward (4.3 and later)

> **Separate from the reference above.** Everything above describes the current setup and the vendor requirements.
> This note is a forward-looking suggestion for developers. Nothing in it has been decided or changed.

This compares the some options in high level for how CMDBuild is run, with ease of maintenance and upgrade as the
deciding factor. Today every patch and upgrade is manual work on a long-lived, hand-installed server, and that is the
pain these options aim to remove. A move to CMDBuild 4.3 is the natural time to change it (better treat it as small project), because Java, Tomcat and
CMDBuild all change at once (see "What the vendors require" above).

| | Today (baseline) | B. EC2 with a complete first-boot script | C. Container on ECS |
|---|---|---|---|
| **How it works** | Install and config are done by hand on one server | `user_data.sh` does the whole install. Java version is a variable and config comes from S3 or Secrets Manager. `terraform apply` replaces the instance. | Java, Tomcat and the CMDBuild WAR are built into one image, and ECS runs it behind the existing ALB. |
| **What a 4.3 upgrade looks like** | Several manual changes on the server, repeated on test and prod | Change the version variables and apply | Build a new image and deploy it |
| **Manual steps left** | Many | Almost none. Config and secrets are stored once. | None on the server. The image build is automated. |
| **Rollback** | Restore the EBS snapshot | Re-deploy the old version, or restore the snapshot | Deploy the previous image |
| **Test and prod the same?** | Only by care | Same code, different variables | Same image in both |
| **Server drift** | Yes, over time | Removed, since the instance is replaced | Not possible, since nothing is edited on a running container |
| **Patching** | OS is automated, Tomcat and Java major versions are manual | Same, or replace the instance | Rebuild the image and redeploy |
| **Future maintenance and upgrade effort** | **High.** Every Tomcat or Java change and every CMDBuild upgrade repeats manual server work on test and prod, and the servers keep drifting. Things will be easy to miss, break and costly to repair. | **Low to medium.** Upgrades are variable changes and an apply. The upkeep is keeping the first-boot script and stored config current. | **Low.** Upgrades are an image build and a deploy. The upkeep is the image pipeline and rebuilding the image for security fixes. |
| **Effort to switch (one time effort)** | N/A (no change) | Small to medium: edit `user_data.sh` and `ec2.tf`, and move config and secrets out of the box | Largest: ECS, image registry, roles, logging and an image build, then retire the EC2, snapshot and patching pieces |
| **Main risk** | Each upgrade repeats manual work on prod | A short outage on replacement | Config injection and slow startup need testing |

**What stays the same whichever option is chosen**

- The 4.3 database migration is one-way, so take an RDS snapshot first.
- 4.3 needs far more memory than the current instance.
- Java, Tomcat and CMDBuild move together.

**Suggestion**

- **B is the minimum step before 4.3.** It turns an upgrade into a change in the repo, with test first and then prod.
- **C is the long-term target**, with the easiest maintenance. B's work (config outside the box, versions as variables)
  carries over to it, so doing B first is not wasted.
- Decide between B and C as part of the 4.3 project, with a small spike on test to settle the C unknowns.
