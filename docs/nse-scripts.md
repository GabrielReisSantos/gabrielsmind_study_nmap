# Working with NSE Scripts

First, set target:
```bash
export target=192.168.1.10
```

## Where to find scripts
- Installed locally, commonly under: `/usr/share/nmap/scripts/`
- Online: Nmap Script Repository (bundled with releases)

## How to run
```bash
# Default scripts (safe)
nmap -sC $target

# By category
nmap --script discovery $target
nmap --script vuln $target

# Specific scripts
nmap --script http-title -p80,443 $target
nmap --script ftp-anon -p21 $target
```

## Update script database
```bash
sudo nmap --script-updatedb
```

## Safety notes
- Some categories (e.g., `intrusive`, `brute`, `exploit`) can disrupt services.
- Prefer `default`/`safe` scripts on production unless you have written approval.
