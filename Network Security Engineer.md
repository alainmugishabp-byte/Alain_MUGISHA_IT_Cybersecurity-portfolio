# Network Security Engineer

**Employer:** Broadband Systems Corporation (BSC) — Kigali, Rwanda
**Duration:** August 2025 – May 2026

## Responsibilities
- Designed and implemented enterprise security infrastructure including firewalls, VPNs, IDS/IPS, and WAF systems
- Conducted threat analysis and coordinated incident response and escalation
- Monitored SOC alerts and ensured timely mitigation of security incidents
- Prepared technical reports and stakeholder communications
- Ensured high availability and security of enterprise systems

## Related Certifications
- Fortinet NSE 1, NSE 2, NSE 3
- ISO/IEC 27001 (ISMS): 2022 Lead Auditor
- Cisco CCNA (Security track)
- Ethical Hacking Essentials (EHE)

## Tools Used
Fortinet, Sophos, Check Point firewalls, IDS/IPS, WAF, Cisco IOS, VPN (site-to-site & remote access)

## Sample Artifacts
*Generic templates reflecting the configuration structure and hardening approach I use — built on FortiGate syntax, with all addresses replaced by RFC 5737 documentation ranges and no client-identifying information.*
- [`sample-firewall-ruleset.conf`](./sample-firewall-ruleset.conf) — FortiGate policy set: segmentation, UTM profiles, explicit default-deny
- [`vpn-config-template.conf`](./vpn-config-template.conf) — FortiGate site-to-site IPsec VPN: IKEv2, AES-256/SHA-256, PFS, DPD
- [`incident-report-template.md`](./incident-report-template.md) — incident documentation format used for stakeholder reporting
