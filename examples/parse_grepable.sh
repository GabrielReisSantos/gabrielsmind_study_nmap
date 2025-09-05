#!/usr/bin/env bash
# Parse .gnmap (grepable) to list open ports per host
# Usage: ./parse_grepable.sh outputs/scan.gnmap

file=${1:-outputs/scan.gnmap}
if [[ ! -f "$file" ]]; then
  echo "File not found: $file" >&2
  exit 1
fi

# Print: host;port/proto;service
grep "Ports:" "$file" | while IFS= read -r line; do
  host=$(echo "$line" | awk '/Host:/{print $2}')
  ports=$(echo "$line" | sed -n 's/.*Ports: //p' | tr ',' '\n' | sed 's/^ *//')
  echo "# $host"
  echo "$ports" | awk -F'/' '{ if ($2=="open") print $1"/"$3 }'
  echo
done
