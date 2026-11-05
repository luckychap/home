#!/usr/bin/env bash

# Argos runs with GNOME Shell's minimal PATH, which lacks the nix profile.
export PATH="$HOME/.nix-profile/bin:$PATH"

set -a
source ~/.config/gh/.vars
set +a

data=$(~/.local/bin/copilot-quota --json)

percent_remaining=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.percent_remaining')
remaining=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.remaining')
entitlement=$(echo "$data" | jq -r '.quota_snapshots.premium_interactions.entitlement')

echo "SUB: $percent_remaining%"
echo "---"
echo "REMAINING TOKENS:"
echo "$remaining / $entitlement"
