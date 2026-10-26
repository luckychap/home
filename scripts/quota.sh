#!/usr/bin/env bash

set -a
source ~/.config/gh/.vars
set +a

data=$(copilot-quota --json)

percent_remaining=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.percent_remaining')
remaining=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.remaining')
entitlement=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.entitlement')

echo "$percent_remaining%"
echo "---"

echo "$remaining / $entitlement"
