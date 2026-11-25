# Runbook: patch or upgrade Tomcat within 10.1.x

**This runbook is only for minor and patch upgrades within the same major version**, moving
Tomcat to a newer 10.1.x release, for example 10.1.60 to a later patch. It does not cover moving to another major
version such as Tomcat 11, or a CMDBuild upgrade.

**Read [component-upgrade-versions.md](component-upgrade-versions.md) first.** It is the base reference for the
versions CMDBuild, Tomcat, Java and PostgreSQL require, and for which of them can move on their own.

**Why this is manual.** Tomcat is a tarball unpacked into `/u01/tomcat` by `Infrastructure/user_data.sh`, not an OS
package, so nightly OS patching never updates it. Tomcat security fixes only arrive when someone runs this runbook.

## How Tomcat is laid out

Everything lives under `/u01/tomcat`, owned by the `tomcat` user and run by the `tomcat` systemd service.

| Path | Contents | During an upgrade |
|---|---|---|
| `bin/`, `lib/` | Tomcat itself | Replace with the new release |
| `bin/setenv.sh` | Java options (prod sets `-Xms2048m -Xmx4096m`). | Keep |
| `conf/` | Tomcat config. `server.xml` on prod is the Tomcat default (HTTP on port 8080, no custom settings). | Keep, then compare against the new defaults |
| `conf/cmdbuild<Env>/` | CMDBuild config (`database.conf` and others) | Keep |
| `webapps/cmdbuild<Env>.war` and `webapps/cmdbuild<Env>/` | CMDBuild | Keep |
| `logs/` | Logs, including `catalina.out` | Keep |
| `work/`, `temp/` | Compiled files and temporary files | Clear |

## Before you start

1. Read the release notes for every version between yours and the target (see the sources below). Look for changes to
   config files and for security fixes.
2. Confirm the target is a 10.1.x release. Tomcat 10.1 needs Java 11 or later, and the servers run Java 17.
3. Download the `.tar.gz` from the Tomcat site and verify it against the published SHA-512 checksum.
4. Upload `apache-tomcat-<version>.tar.gz` to the `<account-id>-tomcat` S3 bucket.
5. Pick a time outside the nightly patch window (02:00 Vancouver time).

## Steps

Do test first, then prod. Run the commands with `sudo` from the SSM session, as shown. Joining the `tomcat` group
is not needed.

1. Take a manual EBS snapshot of the instance as a rollback point.
2. Open a Session Manager (SSM) session. Record the current version and the two files that must survive the upgrade,
   `setenv.sh` (Java memory settings) and `database.conf` (database connection):

   ```bash
   /u01/tomcat/bin/version.sh
   sudo cat /u01/tomcat/bin/setenv.sh
   sudo sha256sum /u01/tomcat/bin/setenv.sh /u01/tomcat/conf/cmdbuild<Env>/database.conf | tee /tmp/keep-files.sha256
   ```

   Prod has both files. If a server has no `setenv.sh` (the heap is only set when `catalina_opts` is set, which prod
   does and test may not), only `database.conf` is listed. That is expected; skip the `setenv.sh` line in step 6.
3. Download the new release to the server and unpack it into a temporary folder:

   ```bash
   aws s3 cp --region ca-central-1 s3://<account-id>-tomcat/apache-tomcat-<version>.tar.gz /tmp/
   mkdir /tmp/tomcat-new && tar -xzf /tmp/apache-tomcat-<version>.tar.gz -C /tmp/tomcat-new --strip-components=1
   ```

4. Compare the new default config with the one in use, to see what changed upstream:
   `diff -r /tmp/tomcat-new/conf /u01/tomcat/conf`. Differences in `server.xml` and `web.xml` matter most.
   Differences from the site's own settings, such as `conf/cmdbuild<Env>/`, are expected.
5. Stop Tomcat and back up the whole install:

   ```bash
   sudo systemctl stop tomcat
   sudo tar czf /tmp/tomcat-backup.tgz -C /u01 tomcat
   ```

6. Replace the Tomcat files, keeping config, the CMDBuild webapp and logs:

   ```bash
   sudo rm -rf /u01/tomcat/bin.old /u01/tomcat/lib.old
   sudo mv /u01/tomcat/bin /u01/tomcat/bin.old
   sudo mv /u01/tomcat/lib /u01/tomcat/lib.old
   sudo cp -a /tmp/tomcat-new/bin /tmp/tomcat-new/lib /u01/tomcat/
   sudo cp -a /u01/tomcat/bin.old/setenv.sh /u01/tomcat/bin/
   sudo rm -rf /u01/tomcat/work/* /u01/tomcat/temp/*
   ```

   The `setenv.sh` line must not fail. If it prints an error on a server that has the file, stop and fix it before
   going on. Do not start Tomcat without it.
7. Apply any config changes found in step 4 to `/u01/tomcat/conf/`.
8. Restore ownership and permissions, as `user_data.sh` sets them:

   ```bash
   sudo chown -R tomcat:tomcat /u01/tomcat
   sudo chmod -R g+rwX /u01/tomcat
   sudo find /u01/tomcat -type d -exec chmod g+s {} +
   ```

9. **Check that the two files are unchanged, before starting Tomcat:**

   ```bash
   sudo sha256sum -c /tmp/keep-files.sha256
   ```

   Every line must end in `OK`. If a line says `FAILED` or the file is missing, do not start Tomcat. Copy the file back
   from `/u01/tomcat/bin.old/` (for `setenv.sh`) or from `/tmp/tomcat-backup.tgz`, then run the check again.
   (Step 7 may deliberately change files in `conf/`, but never `database.conf`.)
10. Start Tomcat: `sudo systemctl start tomcat`. Tomcat is unavailable from step 5 until it finishes starting.
11. Verify:
    - `/u01/tomcat/bin/version.sh` shows the new version.
    - `ps -ef | grep tomcat` shows the memory settings from `setenv.sh` (prod: `-Xms2048m -Xmx4096m`).
    - `/u01/tomcat/logs/catalina.out` has no errors, and none about the database connection.
    - `/cmdbuild<Env>/` loads and OAuth login works.
    - The ALB target is healthy and there are no CloudWatch alarms.
12. Watch it for a day, including one nightly patch run.
13. When stable, remove `bin.old`, `lib.old`, `/tmp/tomcat-new`, the downloaded tarball, `/tmp/tomcat-backup.tgz` and
    `/tmp/keep-files.sha256`.

## Rollback

```bash
sudo systemctl stop tomcat
sudo tar xzf /tmp/tomcat-backup.tgz -C /u01
sudo systemctl start tomcat
```

If that fails, restore the EBS snapshot. See [CMDB - Restoring EC2 Instance from Backup](https://hlth.atlassian.net/wiki/spaces/HA/pages/1176043613/CMDB+-+Restoring+EC2+Instance+from+Backup) on Confluence.

## Afterwards (repo and docs)

- Set `tomcat_version` in `Infrastructure/variables.tf` to the new version, so a rebuilt instance gets the same one.
  The variable only affects newly created instances.
- Update the Tomcat version in `docs/component-upgrade-versions.md` and `docs/infrastructure-and-deployment.md`.

## Sources

- [Tomcat 10 downloads and checksums](https://tomcat.apache.org/download-10.cgi)
- [Tomcat 10.1 release notes (changelog)](https://tomcat.apache.org/tomcat-10.1-doc/changelog.html)
- [Tomcat 10 security fixes](https://tomcat.apache.org/security-10.html)
