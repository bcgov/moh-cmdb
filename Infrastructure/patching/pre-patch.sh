# Pre-install hook for the nightly patch run. patching.tf renders this file with
# templatefile(). If this script fails, Patch Manager installs nothing and doesn't
# reboot, and the failure is emailed.
set -euo pipefail

# Only patch when tonight's snapshot from snapshots.tf has finished, so the server
# can be put back with Replace root volume if the patches break it.
latest=$(aws ec2 describe-snapshots --region ${region} --owner-ids self \
  --filters "Name=tag:Name,Values=${snapshot_name}" "Name=status,Values=completed" \
  --query 'sort_by(Snapshots, &StartTime)[-1].StartTime' --output text)

if [ -z "$latest" ] || [ "$latest" = "None" ]; then
  echo "No completed ${snapshot_name} snapshot found. Not patching." >&2
  exit 1
fi

age_hours=$(( ($(date -u +%s) - $(date -u -d "$latest" +%s)) / 3600 ))
if [ "$age_hours" -ge ${max_snapshot_age_hours} ]; then
  echo "Newest ${snapshot_name} snapshot started at $latest, $age_hours hours ago. Not patching." >&2
  exit 1
fi
echo "Pre-patch snapshot started at $latest ($age_hours hours ago)."

# Stop Tomcat so it isn't running while Java and Tomcat packages are replaced.
# The post-patch hook starts it again, even if the install fails.
systemctl stop ${tomcat_service}
echo "Stopped ${tomcat_service}."
