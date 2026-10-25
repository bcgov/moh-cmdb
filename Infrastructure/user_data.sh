#!/bin/bash
# First-boot setup for the CMDB EC2 instance: Java 17 and Tomcat 10 as a service.
# Runs once, when the instance is created; the output is in
# /var/log/cloud-init-output.log. ec2.tf ignores later edits to this file, so
# changes here only reach a new or rebuilt instance.
set -euo pipefail

# Both come from the Amazon Linux repositories, so the nightly patch run
# (patching.tf) keeps Java and Tomcat patched along with the rest of the OS.
# tomcat10-webapps adds the ROOT app, which answers the ALB health check on "/"
# until CMDBuild is deployed.
dnf install -y java-17-amazon-corretto java-17-amazon-corretto-headless tomcat10 tomcat10-webapps

# Run Tomcat on Corretto 17 (CMDBuild 4.2 needs Java 17) even if another JDK is
# installed later. /etc/sysconfig/tomcat10 is the package's file for local settings.
cat >> /etc/sysconfig/tomcat10 <<'EOF'

# Added by user_data.sh
JAVA_HOME="/usr/lib/jvm/java-17-amazon-corretto"
EOF

# Start Tomcat now and on every boot, so a patching reboot brings CMDB back by itself.
systemctl enable --now tomcat10
