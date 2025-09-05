#!/usr/bin/env bash
# Scan a subnet for live hosts and top ports
# Usage: ./scan_subnet.sh 192.168.1.0/24

set -euo pipefail

CIDR="${1:-}"
[[ -z "$CIDR" ]] && { echo "Usage: $0 <CIDR>"; exit 1; }

OUTDIR="outputs/$(echo "$CIDR" | tr '/' '_')"
mkdir -p "$OUTDIR"

echo "[*] Discovering live hosts in $CIDR ..."
nmap -sn "$CIDR" -oG "$OUTDIR/hosts.gnmap" > /dev/null

HOSTS=$(awk '/Up$/{print $2}' "$OUTDIR/hosts.gnmap")
echo "[*] Found hosts:"
echo "$HOSTS"

for h in $HOSTS; do
  echo "[*] Scanning top ports on $h ..."
  nmap --top-ports 20 -sV -oA "$OUTDIR/$h" "$h"
done

echo "[+] Done. See $OUTDIR for results."
