# Getting Started with Nmap

## Set environment variable
```bash
export target=192.168.1.10
```
Then replace any IP with `$target`.

## Basic syntax
```bash
nmap [options] [target]
```
- **options**: scan type, timing, output, scripts, etc.
- **target**: host, range (`$target-50`), or CIDR (`192.168.1.0/24`).

## Discovery
```bash
# Ping sweep (no ports)
nmap -sn 192.168.1.0/24
```

## Port scanning
```bash
# Specific ports
nmap -p 22,80,443 $target

# Range
nmap -p 1-1000 $target

# All TCP ports with a SYN (half‑open) scan
nmap -p- -sS $target

# UDP (slower, more noisy)
nmap -sU $target
```

## Service & OS detection
```bash
# Service versions
nmap -sV $target

# OS fingerprint (root required on Unix)
sudo nmap -O $target

# A sensible combo in labs
sudo nmap -sS -sV -O -p- -T4 $target
```

## Reading output
- **Host status**: `up`/`down`
- **Port state**: `open`, `closed`, `filtered`
- **Service/version**: if `-sV` used
- **OS guess**: if `-O` used

## Save results
```bash
nmap -oN outputs/scan.txt $target
nmap -oX outputs/scan.xml $target
nmap -oG outputs/scan.grep $target
nmap -oA outputs/scan $target
```
