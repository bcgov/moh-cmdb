#!/bin/bash
# First-boot setup for the CMDB EC2 instance: Java 17, Tomcat 10 in /u01/tomcat as
# the "tomcat" systemd service, and the CMDBuild WAR. ec2.tf renders this file with
# templatefile(). It runs once, as root, when the instance is created; the output
# is in /var/log/cloud-init-output.log.
set -euxo pipefail

sudo yum install -y java-17-amazon-corretto.x86_64
sudo mkdir -p /u01

# Tomcat, unpacked from the tarball in the tomcat S3 bucket.
id tomcat >/dev/null 2>&1 || useradd --system --no-create-home --home-dir /u01/tomcat --shell /sbin/nologin tomcat
aws s3 cp --region ${region} s3://${bucket}/apache-tomcat-${tomcat_version}.tar.gz /tmp/
mkdir -p /u01/tomcat
tar -xzf /tmp/apache-tomcat-${tomcat_version}.tar.gz -C /u01/tomcat --strip-components=1
rm -f /tmp/apache-tomcat-${tomcat_version}.tar.gz

# CMDBuild, served at /${cmdbuild_webapp}. It needs its config files in
# /u01/tomcat/conf/${cmdbuild_webapp}/, added by hand, before it works. A failed
# download doesn't stop Tomcat from being set up.
if ! aws s3 cp --region ${region} s3://${bucket}/${cmdbuild_war} /u01/tomcat/webapps/${cmdbuild_webapp}.war; then
  rm -f /u01/tomcat/webapps/${cmdbuild_webapp}.war
  echo "Could not download s3://${bucket}/${cmdbuild_war}. Deploy CMDBuild by hand." >&2
fi

chown -R tomcat:tomcat /u01/tomcat

# Run Tomcat as a service: "systemctl restart tomcat" works, and it starts on every boot.
cat > /etc/systemd/system/tomcat.service <<'EOF'
[Unit]
Description=Apache Tomcat 10 for CMDB
After=network-online.target
Wants=network-online.target

[Service]
Type=forking
User=tomcat
Group=tomcat
Environment=JAVA_HOME=/usr/lib/jvm/java-17-amazon-corretto
Environment=CATALINA_HOME=/u01/tomcat
Environment=CATALINA_BASE=/u01/tomcat
Environment=CATALINA_PID=/u01/tomcat/temp/tomcat.pid
PIDFile=/u01/tomcat/temp/tomcat.pid
ExecStart=/u01/tomcat/bin/startup.sh
ExecStop=/u01/tomcat/bin/shutdown.sh 30 -force
SuccessExitStatus=143
Restart=on-failure
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now tomcat
