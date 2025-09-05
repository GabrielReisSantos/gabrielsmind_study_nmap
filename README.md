# Nmap – Gabriel'smind study guide

A clean, GitHub‑ready companion to the **Nmap** quick guide. It includes:
- Step‑by‑step docs (from install → advanced)
- Commented one‑liners you can paste and run
- Cheatsheets, troubleshooting, and NSE tips
- Small helper scripts for common tasks

> ⚠️ **Legal & Ethical**: Scan only assets you own or have **explicit written permission** to assess. Some scans are intrusive and may degrade service availability.

## Quick Start

### Set a target first
```bash
export target=192.168.1.10
```
Then use `$target` in all commands.


### Install
**Linux (Debian/Ubuntu)**
```bash
sudo apt-get update && sudo apt-get install -y nmap
```

**macOS (Homebrew)**
```bash
brew install nmap
```

**Windows**
- Download the latest installer from https://nmap.org/ and follow the wizard.

### Your first scans
**Discover live hosts (no port scan)**
```bash
nmap -sn 192.168.1.0/24
```

**Top 20 ports + service versions**
```bash
nmap --top-ports 20 -sV $target
```

**Full TCP sweep (all ports)**
```bash
nmap -p- -sS -T4 $target
```

**OS + version + default scripts**
```bash
sudo nmap -O -sV -sC $target
```

**Aggressive profile (noisy but thorough)**
```bash
nmap -A $target
```

### Output to files
```bash
# Normal text
nmap -oN outputs/scan.txt $target

# XML (automation-friendly)
nmap -oX outputs/scan.xml $target

# Grepable
nmap -oG outputs/scan.grep $target

# All at once (adds .nmap, .xml, .gnmap)
nmap -oA outputs/scan $target
```

## What’s inside
- `docs/getting-started.md` – basic syntax, common scans, reading output
- `docs/advanced-techniques.md` – timing, evasion, NSE, OS detection
- `docs/nse-scripts.md` – how to find, update, and run scripts safely
- `docs/troubleshooting.md` – slow scans, filtered ports, host discovery
- `cheatsheets/nmap-cheatsheet.md` – copy‑paste friendly command atlas
- `examples/` – realistic one‑liners for subnets, files, and parsing
- `scripts/` – simple wrappers for repeatable workflows

## Safety knobs you should know
- `-T0 … -T5` – timing template (slowest → fastest). Start with `-T3`/`-T4` in labs.
- `--max-retries N` – limit retries on silent hosts.
- `--host-timeout 5m` – stop scanning a host after 5 minutes.
- `--min-rate 500` – send at least 500 probes/sec (be careful on prod).

## NSE in 30 seconds
```bash
# Default "safe" scripts
nmap -sC $target

# Select by category
nmap --script vuln $target

# Run a specific script
nmap --script http-title -p80,443 $target

# Update local script DB (paths vary by distro)
sudo nmap --script-updatedb
```
> Tip: NSE scripts live (commonly) under `/usr/share/nmap/scripts/`.

## Extra tools in the Nmap suite
- **Ncat** — secure netcat replacement; port forwarders, relays, TLS.
  ```bash
  ncat --ssl $target 443
  ncat -l 8080 --sh-exec "echo 'Hello World'"
  ```
- **Nping** — craft TCP/UDP/ICMP to test latency and firewalls.
  ```bash
  nping --tcp -p 80 $target
  nping --tcp --flags SYN --ttl 64 --data-string "Test" $target
  ```
- **Zenmap** — optional GUI for profiles/topology visualization.

## Evasion basics (for approved testing only)
```bash
# Fragment packets (root needed)
sudo nmap -f $target

# Use decoys
nmap -D RND:10 $target

# Manipulate TTL
nmap --ttl 10 $target
```

---

**Quick win:** try `examples/sample-commands.sh` and tweak target ranges.
