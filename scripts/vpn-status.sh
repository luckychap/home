#!/usr/bin/env bash

full_status=$(globalprotect show --status)
status=$(echo "$full_status" | awk '{print $4}')

if [ "$status" = "Connected" ]; then
  echo "🌞"
else
  echo "🌙"
fi
echo "---"

echo "$full_status"
