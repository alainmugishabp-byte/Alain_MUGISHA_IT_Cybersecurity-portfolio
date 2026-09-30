# Firewall Policy Table

| ID | Name | Source | Destination | Service | Action | NAT | Log | Business reason |
|----|------|--------|-------------|---------|--------|-----|-----|-----------------|
| 1 | Users-to-Internet | NET_USERS (vlan10) | all (wan1) | HTTP, HTTPS, DNS | Accept | Yes | All | Staff web access |
| 2 | Users-to-WebServer | NET_USERS | SRV_WEB (vlan50) | HTTPS | Accept | No | All | Staff use the internal web app |
| 3 | Web-to-DB | SRV_WEB | SRV_DB | TCP 3306 | Accept | No | All | App needs its database only |
| 4 | Internet-to-DMZ-Web | all (wan1) | VIP_WEB_443 | HTTPS | Accept | DNAT | All | Public website |
| 999 | Deny-All-Log | any | any | ALL | Deny | n/a | All | Default deny, visible in logs |

Policy order matters: specific rules above, deny-all last.
