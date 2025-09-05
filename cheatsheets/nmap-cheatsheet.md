# Nmap Cheatsheet

Set once and reuse:
```bash
export target=192.168.1.10
```

## Discovery
```bash
nmap -sn 192.168.1.0/24
```

## TCP/UDP
```bash
nmap -sS $target       # SYN (half‑open)
nmap -sT $target       # TCP connect
nmap -sU $target       # UDP
nmap -p- $target       # all TCP ports
nmap -p 1-1000 $target # range
```

## Fingerprinting
```bash
nmap -sV $target       # service versions
sudo nmap -O $target   # OS detection
nmap -A $target        # aggressive (OS, versions, scripts, traceroute)
```

## NSE
```bash
nmap -sC $target
nmap --script vuln $target
nmap --script http-title -p80,443 $target
sudo nmap --script-updatedb
```

## Output
```bash
nmap -oN out.txt $target
nmap -oX out.xml $target
nmap -oG out.grep $target
nmap -oA base $target
```

## Performance
```bash
nmap -T4 $target
nmap --max-retries 2 --host-timeout 5m $target
nmap --min-rate 500 $target
```

## Evasion (authorized tests only)
```bash
sudo nmap -f $target
nmap -D RND:10 $target
nmap --ttl 10 $target
```
