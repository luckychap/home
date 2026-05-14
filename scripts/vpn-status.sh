#!/usr/bin/env bash

status=$(globalprotect show --status | awk '{print $4}')

if [ "$status" = "Connected" ]; then
  echo "🌞"
else
  echo "🌙"
fi