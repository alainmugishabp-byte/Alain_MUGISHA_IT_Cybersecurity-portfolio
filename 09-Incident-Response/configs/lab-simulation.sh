#!/bin/bash
# LAB ONLY: generates benign test traffic from 10.10.10.50 inside your own lab to simulate a compromised host.
# 1) Beaconing: repeated outbound connections to a lab "C2" server you control (e.g. Kali at 203.0.113.50)
for i in $(seq 1 30); do curl -s -m 2 http://203.0.113.50:8080/beacon >/dev/null; sleep 10; done &
# 2) Internal scanning of the server VLAN (your lab only)
nmap -sS -p 22,80,443,3306 10.10.20.0/24
