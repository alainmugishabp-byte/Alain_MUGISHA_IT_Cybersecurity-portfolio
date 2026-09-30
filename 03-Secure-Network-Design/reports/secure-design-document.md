# Secure Multi-Site Network Design Document

## 1. Assumed requirements
- Two sites: HQ (about 200 users) and Branch (about 30 users).
- Public website, guest Wi-Fi, internal databases, central logging.
- Principles: least privilege, defense in depth, everything logged.

## 2. Design summary
Internet -> Edge Firewall -> Core Switch -> VLANs (Users, Servers, Management, Guest) plus a DMZ on its own firewall interface. Branch connects to HQ through an IPsec site-to-site VPN. See `../diagrams/`.

## 3. Key design decisions
| Decision | Reason |
|---|---|
| Segment into VLANs/zones | Limits lateral movement if one host is compromised |
| Dedicated Management VLAN | Admin interfaces are reachable only from trusted admin hosts |
| DMZ on separate interface | Public-facing server cannot reach Users; only the required DB port to Servers |
| Guest isolated | Untrusted devices get Internet only |
| IPsec VPN with AES-256/SHA-256/DH14 | Protects inter-site traffic over the Internet |
| Central logging | Detection and investigation need one place to look |
| HA pair of firewalls (recommended, not built in lab) | Removes the firewall as a single point of failure |

## 4. Threats and mitigating controls
| Threat | Control |
|---|---|
| Phishing leading to a compromised PC | Segmentation, web filtering, IPS, monitoring |
| Lateral movement | Inter-VLAN policies, default deny |
| Exposed services | Only required ports published; vulnerability scanning |
| Insider misuse | Role-based admin, logging, least privilege |
| Eavesdropping between sites | IPsec encryption |

## 5. Limitations and future improvements
Lab uses evaluation licenses and virtual devices; no HA, no real ISP failover, no NAC on wired ports. Next steps: HA, 802.1X, SIEM integration.
