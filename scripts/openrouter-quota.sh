#!/usr/bin/env bash

# Argos runs with GNOME Shell's minimal PATH, which lacks the nix profile.
export PATH="$HOME/.nix-profile/bin:$PATH"

# Expects OPENROUTER_API_KEY=... in this file.
set -a
source ~/.config/or/.vars
set +a

data=$(curl -fsS -H "Authorization: Bearer $OPENROUTER_API_KEY" https://openrouter.ai/api/v1/credits) || {
  echo "OR: error"
  exit 0
}

total=$(echo "$data" | jq -r '.data.total_credits')
usage=$(echo "$data" | jq -r '.data.total_usage')
remaining=$(jq -n --argjson t "$total" --argjson u "$usage" '$t - $u')

printf 'OR: $%.2f\n' "$remaining"
echo "---"
key=$(curl -fsS -H "Authorization: Bearer $OPENROUTER_API_KEY" https://openrouter.ai/api/v1/key) || key='{"data":{}}'

# OpenRouter only exposes per-UTC-day usage, not a rolling 24h window.
echo "SPENT (this key):"
printf 'Today spent: $%.2f\n' "$(echo "$key" | jq -r '.data.usage_daily // 0')"
printf 'This week spent: $%.2f\n' "$(echo "$key" | jq -r '.data.usage_weekly // 0')"
