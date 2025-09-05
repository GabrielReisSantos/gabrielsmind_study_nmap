# Troubleshooting

Reminder: set target first with:
```bash
export target=192.168.1.10
```

## Host appears down
- ICMP blocked → try skipping host discovery:
```bash
nmap -Pn $target
```

## Everything "filtered"
- A firewall is dropping probes → try different scan types or slower timing:
```bash
nmap -sS -T3 $target
nmap --traceroute $target
```

## Very slow scans
- High latency, rate limits, or IDS
```bash
nmap -T4 --max-retries 2 --host-timeout 5m $target
```

## UDP looks empty
- UDP is noisy/slow; target may ignore probes
```bash
nmap -sU --top-ports 20 $target
```

## NSE errors
- Update/refresh DB and check permissions
```bash
sudo nmap --script-updatedb
```

## Output file not found
- Check path/permissions; prefer absolute paths
```bash
nmap -oN $(pwd)/outputs/scan.txt $target
```
