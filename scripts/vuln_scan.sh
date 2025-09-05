#!/usr/bin/env bash
# Run NSE vuln category against a target (authorized testing only)
# Usage: sudo ./vuln_scan.sh $target

set -euo pipefail

TARGET="${1:-}"
[[ -z "$TARGET" ]] && { echo "Usage: $0 <target>"; exit 1; }

OUTDIR="outputs/vuln"
mkdir -p "$OUTDIR"

echo "[*] Running vuln scripts against $TARGET ..."
sudo nmap --script vuln -sV -oA "$OUTDIR/$TARGET" "$TARGET"

echo "[+] Results saved to $OUTDIR"
