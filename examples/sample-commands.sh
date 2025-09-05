#!/usr/bin/env bash
# Example one‑liners (edit targets to your range)

# 1) Live hosts in a /24
nmap -sn 192.168.1.0/24

# 2) Quick TCP top ports + versions
nmap --top-ports 20 -sV $target

# 3) Full TCP sweep + save all outputs
nmap -p- -sS -T4 -oA outputs/host_full $target

# 4) Default scripts + versions
nmap -sC -sV $target

# 5) UDP top ports
nmap -sU --top-ports 20 $target

# 6) OS detection (root on Unix)
sudo nmap -O $target
