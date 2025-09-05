# Advanced Techniques

Tip: before running, set target:
```bash
export target=192.168.1.10
```

## Timing & performance
```bash
# Use template T0..T5 (slow → fast)
nmap -T4 $target

# Caps on per-host time and retries
nmap --host-timeout 5m --max-retries 2 $target

# Rate controls
nmap --min-rate 500 $target
```
**Trade‑offs**: higher speed → more network load and easier detection.

## Output & reporting
```bash
# Normal text
nmap -oN outputs/scan.txt $target

# XML for pipelines (XSLT, Python parsers, etc.)
nmap -oX outputs/scan.xml $target

# Grepable for quick filtering
nmap -oG outputs/scan.grep $target

# All formats
nmap -oA outputs/scan $target
```

## NSE – Nmap Scripting Engine
```bash
# Default scripts
nmap -sC $target

# Categories: discovery, vuln, auth, brute, exploit, intrusive, etc.
nmap --script vuln $target

# Single script
nmap --script http-title -p80,443 $target

# Update local DB
sudo nmap --script-updatedb
```
Scripts often live under `/usr/share/nmap/scripts/` (Linux).

## OS detection
```bash
sudo nmap -O $target
nmap -sV $target
nmap -O -sV $target
```
**Notes**: works best when some ports are open; firewalls can affect accuracy.

## Firewall/IDS evasion
```bash
# Fragment packets (root)
sudo nmap -f $target

# Decoys
nmap -D RND:10 $target

# Tweak TTL
nmap --ttl 10 $target
```
Only use with authorization; these are intrusive and can trigger alerts.

## Nping (packet generator)
```bash
nping --tcp -p 80 $target
nping --tcp --flags SYN --ttl 64 --data-string "Test Packet" $target
```

## Ncat (secure netcat)
```bash
ncat --ssl $target 443
ncat -l 8080 --sh-exec "echo 'Hello World'"
```

## Zenmap
The official GUI for Nmap. Useful for scan profiles and topology visualization.
