# Lab Setup (shared by all projects)

**Tools**
- **EVE-NG Community** or **GNS3** (for FortiGate, Kali, servers)
- **FortiGate-VM** and **FortiAnalyzer-VM** (Fortinet free trial/evaluation; limited features but enough for this portfolio)
- **Cisco Packet Tracer** (free from Cisco NetAcad) for Project 10
- **Kali Linux** (attacker/scanner), **Ubuntu Server** (web/SSH server), **Windows 10/11** (user PC), optional **Metasploitable2** (intentionally vulnerable target)
- **Draw.io (diagrams.net)** for topology diagrams, **Git** for version control

**Master addressing plan**

| Site | Zone | VLAN | Subnet | Gateway |
|---|---|---|---|---|
| HQ | Users | 10 | 10.10.10.0/24 | 10.10.10.1 |
| HQ | Servers | 20 | 10.10.20.0/24 | 10.10.20.1 |
| HQ | Management | 30 | 10.10.30.0/24 | 10.10.30.1 |
| HQ | Guest | 40 | 10.10.40.0/24 | 10.10.40.1 |
| HQ | DMZ | 50 | 10.10.50.0/24 | 10.10.50.1 |
| Branch | Users | n/a | 10.20.10.0/24 | 10.20.10.1 |
| WAN HQ | n/a | n/a | 203.0.113.1/30 | n/a |
| WAN Branch | n/a | n/a | 198.51.100.1/30 | n/a |

**Suggested repo structure**

```
network-security-portfolio/
├── README.md
├── 01-network-security/
├── 02-firewall-configuration/
├── 03-secure-network-design/
├── 04-ipsec-vpn/
├── 05-vulnerability-assessment/
├── 06-security-hardening/
├── 07-access-control/
├── 08-network-monitoring/
├── 09-incident-response/
└── 10-cisco-security-lab/
    (each: README.md, /diagrams, /configs, /screenshots, /reports)
```

**README template for every project:** Objective → Scope/Topology → Tools → Implementation Steps → Testing/Verification → Results → Lessons Learned / Improvements.
