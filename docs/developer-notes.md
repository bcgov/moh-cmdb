# Developer notes

* Findings and cleanup notes. Things to know about this project and its code that are not obvious from reading it.
(Update this file or remove the item that is no longer valid or has been cleaned up)
* How the project runs on AWS and how it is deployed is in
[infrastructure-and-deployment.md](infrastructure-and-deployment.md).
* [CMDBuild going forward (4.3 and later)](component-upgrade-versions.md#note-how-to-run-cmdbuild-going-forward-43-and-later)

**Terms:** ASEA = the old AWS account that ran previous CMDB. LZA = the new AWS landing zone this project now runs in.

---

## Past folder structure (possible leftovers, cleanup needed)

These folders pre-date the AWS migration. None of them is referenced by `Infrastructure/`, `Terraform/` or the
GitHub workflows. They may be leftovers and need a cleanup/document migration review before anything is removed.

| Path | What it contains |
|---|---|
| `cmdb/Release1/` | SQL scripts for the initial database load: lookup values, storage and software conversions, survey question inserts. `readme.txt` lists the order to run them. |
| `cmdb/Release2/` | SQL views and queries: RADAR data, questionnaire data, software-technology capability, and Keycloak application and contact lists. `WIP.sql` is a copy of `keycloak_apps.sql`. |
| `cmdb/Script Files/` | `CMDB_Global.sql` (application and server report) and two folders, `Cloud_Capabilities_RADAR` and `Cloud_Organizations`. |
| `cmdb/Production Configuration/` | A 2023 copy of the old production Tomcat and CMDBuild config: LDAP settings, IDIR certificate files, `permanent.jks`, `setenv.sh`, and data-bus job files in `conf/cmdbuildProd/bus/`. See the Authentication section below. |
| `cmdb/Dockerfile`, `cmdb/database.conf`, `cmdb/README.md` | A Docker build for CMDBuild. The README says it is blocked by a broken base image. |


## Authentication: OAuth only, LDAP/JKS setup is leftover

**Source:** [CMDB page on Confluence](https://hlth.atlassian.net/wiki/spaces/HA/pages/515612376/CMDB)
says CMDB moved from IDIR username/password authentication to Keycloak after moving to AWS. Users click
**Login with Oauth2** on the CMDB login page, which redirects to the ministry common logon (Keycloak) and
offers "Log in with IDIR MFA".

**Checked on the servers (2026-11-12).** ASEA = old servers, LZA = new AWS servers.

| Server | `permanent.jks` | `setenv.sh` | Truststore flag on running Tomcat | `ldap.enabled` in `auth.conf` |
|---|---|---|---|---|
| LZA TEST | not present | not present | none | `true` |
| ASEA TEST | present | present in `bin/` and `conf/`. `bin/setenv.sh` (the one Tomcat reads) has the truststore lines commented out. `conf/setenv.sh` has the `trustStore` line active, but Tomcat does not read `conf/` | not checkable: Tomcat has been stopped since cutover to LZA (last logs 2026-10-27) | `true` |
| ASEA PROD | present | present; the `trustStore`, `trustStorePassword` and LDAP endpoint lines are commented out | none | `true` |

**What the code still contains:**
- `cmdb/Production Configuration/` is a copy of the old production config. It has LDAP settings in
  `conf/cmdbuildProd/auth.conf`, `conf/permanent.jks`, the IDIR certificate files (`IDIRInfrastructureAuthority*.crt`,
  `idir.cer`, `idir2.cer`) and `conf/setenv.sh` pointing Java at the truststore.
- `fam_console_idp_name` in `Terraform/*/terragrunt.hcl` is only echoed to an output; it does not configure login.

**Confirmed:**
- No JKS or IDIR certificate setup is needed in the LZA environments. LZA TEST works without any.
- The LDAP settings, `permanent.jks`, the IDIR certificate files and the `setenv.sh` truststore lines are
  leftovers that were never cleaned up. On ASEA PROD the truststore lines are already commented out.
- The username/password form is still shown on the login page, and `ldap.enabled = true` is still set.

**Unknown:** whether the username/password form still logs in through LDAP.

**Not in this repo:** the OAuth settings. CMDBuild keeps them in its database (admin UI), not in files, so
they are not visible here. After a database import into a new environment, check that they are present.

**Possible cleanup:**
- Turn LDAP off in the CMDBuild admin UI (Authentication settings). Editing `auth.conf` on disk does not
  persist, because CMDBuild overwrites it from the database.
- Remove the unused JKS and IDIR certificate files from `cmdb/Production Configuration/conf/`, or mark that
  folder as legacy.
- Do not copy `permanent.jks`, the IDIR certificate files or `setenv.sh` to new environments.
  The old PROD `setenv.sh` also sets `JAVA_HOME=/`, which is wrong on LZA.
