#/usr/bin/env bash
# set -x

# echo "VPN"
# echo "---"

status=$(globalprotect show --status | awk '{print $4}')

# echo ${#status}
if [ "$status" = "Connected" ]; then
  echo "🌞"
else
  echo "🌙"
fi