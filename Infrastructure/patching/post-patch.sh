# On-exit hook for the nightly patch run. patching.tf renders this file with
# templatefile(). It runs at the end of every Install run: after the reboot if
# there was one, after a failed step, and on nights with nothing to install. If
# CMDB doesn't answer, or its boot status isn't READY, the run fails and the failure is emailed.
set -uo pipefail

systemctl start ${tomcat_service}

url="http://localhost:${app_port}${health_check_path}"
status_url="http://localhost:${app_port}${status_path}"
code=000
body=""
for attempt in $(seq 1 60); do
  # Check 1: the CMDBuild web app answers (200-399; its own redirect is a 302).
  code=$(curl -s --max-time 10 -o /dev/null -w '%%{http_code}' "$url") || code=000
  # Check 2: CMDBuild's boot status API says READY (application finished starting).
  body=$(curl -s --max-time 10 "$status_url") || body=""
  if [ "$code" -ge 200 ] && [ "$code" -lt 400 ] && \
     echo "$body" | grep -Eq '"status"[[:space:]]*:[[:space:]]*"READY"'; then
    echo "$url answered HTTP $code and $status_url reported READY on attempt $attempt."
    exit 0
  fi
  sleep 10
done

echo "CMDB not healthy within 10 minutes. $url last code: $code. $status_url last response: $body" >&2
systemctl status ${tomcat_service} --no-pager >&2
exit 1
