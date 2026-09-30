# VPN Parameters

| Item | Phase 1 | Phase 2 |
|---|---|---|
| IKE version | IKEv2 | n/a |
| Encryption / Integrity | AES-256 / SHA-256 | AES-256 / SHA-256 |
| DH group | 14 | PFS group 14 |
| Authentication | Pre-shared key (<PSK>, not published) | n/a |
| Dead-peer detection | On-idle | n/a |
| Local subnet | n/a | 10.10.10.0/24 |
| Remote subnet | n/a | 10.20.10.0/24 |

Improvement to mention: replace PSK with certificates in production; use stronger DH (e.g. 19/20) where supported.
