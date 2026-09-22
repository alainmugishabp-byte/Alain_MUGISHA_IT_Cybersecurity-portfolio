# IT Support Procedure — Template

*Reflects the troubleshooting documentation structure I use for common end-user support tickets, in SLA-driven ticketing environments. Example values are placeholders.*

## Procedure: [e.g. "Resolving VPN Connectivity Failure for Remote Users"]

**Ticket Category:** Network / Connectivity
**Target Resolution Time (SLA):** [e.g. 2 hours — Priority: Medium]
**Applies To:** Remote/hybrid end users connecting via company VPN client

### 1. Initial Information to Collect
- User's device type and OS version
- VPN client version
- Exact error message/code shown
- Network type (home Wi-Fi, mobile hotspot, public Wi-Fi)
- Time issue started / whether it's intermittent or constant

### 2. Diagnostic Steps
| Step | Action | Expected Result |
|---|---|---|
| 1 | Confirm user has active internet access (browse to a known site) | Internet works independently of VPN |
| 2 | Ping/traceroute to VPN gateway (`<gateway-placeholder>`) | Identify if failure is local network vs. gateway-side |
| 3 | Check VPN client logs for authentication vs. connection errors | Narrows to credential issue vs. network/firewall issue |
| 4 | Verify account is not locked/expired in AD | Confirms it's not an identity issue |
| 5 | Check gateway-side session/license limits with network team if multiple users affected | Confirms if it's capacity-related, not just this user |

### 3. Common Resolutions
- **Authentication failure:** reset password, confirm MFA enrollment is current
- **Client-side issue:** clear cached credentials, reinstall/update VPN client
- **Network-side block:** confirm user's local firewall/ISP isn't blocking the VPN port (common on public Wi-Fi)
- **Gateway-side issue:** escalate to network/security team if multiple users report simultaneous failures

### 4. Escalation Path
1. **Tier 1 (Support Desk):** basic diagnostics above; resolve if client-side or account-side
2. **Tier 2 (System/Network Admin):** gateway logs, session limits, firewall rule review
3. **Tier 3 (Network Security Engineer):** VPN configuration, certificate, or infrastructure-level issue

### 5. Documentation on Closure
- Root cause recorded in ticket
- Resolution steps taken
- If recurring for the same user/device, flag for pattern review
- Update this procedure if a new root cause type is discovered

---
*Used as a living document — updated whenever a new recurring issue type is identified, to reduce repeat troubleshooting time.*
