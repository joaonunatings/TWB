#!/bin/bash

new_max_farm="${1:-25}"
tmpfile=$(mktemp)

cp config.json "$tmpfile" &&
jq --argjson newfarm "$new_max_farm" '.farms.max_farms |= $newfarm' "$tmpfile" > config.json &&
rm -f -- "$tmpfile"
