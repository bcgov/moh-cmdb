# On-exit hook for the nightly patch run. patching.tf renders this file with
# templatefile(). It runs at the end of every Install run: after the reboot if
# there was one, after a failed step, and on nights with nothing to install. If
# CMDB doesn't answer, the run fails and the failure is emailed.
set -uo pipefail

systemctl start ${tomcat_service}

url="http://localhost:${app_port}${health_check_path}"
code=000
for attempt in $(seq 1 60); do
  code=$(curl -s -o /dev/null -w '%%{http_code}' "$url") || code=000
  if [ "$code" -ge 200 ] && [ "$code" -lt 400 ]; then
    echo "$url answered HTTP $code on attempt $attempt."
    exit 0
  fi
  sleep 10
done

echo "$url did not answer with HTTP 200-399 within 10 minutes (last code: $code)." >&2
systemctl status ${tomcat_service} --no-pager >&2
exit 1
