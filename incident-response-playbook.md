# SOC Incident Response Playbook — Suspicious Login / Brute Force Activity

*This reflects the triage and response structure I use for common SOC alert categories. Example values below are placeholders — no real hostnames, IPs, or client data.*

## Scope
Applies to alerts involving repeated failed authentication attempts, credential brute-forcing, or suspicious login activity against externally facing services (VPN gateway, webmail, admin portals).

## 1. Alert Trigger Criteria
- ≥ 5 failed login attempts from a single source within 5 minutes, **or**
- Successful login immediately following multiple failures ("password spray" pattern), **or**
- Login attempt from a geographic location inconsistent with the user's normal pattern (impossible travel)

## 2. Triage (Tier 1)
| Step | Action |
|---|---|
| 1 | Confirm alert is not a false positive (check for known scheduled jobs, VPN client misconfiguration, shared service accounts) |
| 2 | Identify source IP, targeted account(s), and targeted service |
| 3 | Check source IP reputation (VirusTotal / threat intel feed) |
| 4 | Classify severity: Low (isolated, low-value account) / Medium (privileged account, repeated pattern) / High (successful login after brute force, or admin account targeted) |
| 5 | Escalate to Tier 2 if Medium or High |

## 3. Investigation (Tier 2)
- Pull authentication logs for the account over the preceding 24–72 hours
- Check for lateral movement indicators if login succeeded (new sessions, privilege changes, unusual resource access)
- Correlate with IDS/IPS and firewall logs for the same source IP across other systems
- Determine whether MFA was enforced and whether it was bypassed or not required

## 4. Containment
- Block source IP at the firewall/WAF (temporary rule, time-boxed for review)
- Force password reset on targeted account(s) if compromise is suspected
- Disable account temporarily if active compromise is confirmed
- Notify system/account owner

## 5. Eradication & Recovery
- Confirm no persistence mechanisms were established (new scheduled tasks, new admin accounts, forwarding rules on email)
- Re-enable account only after password reset + MFA re-enrollment
- Remove temporary firewall block once confirmed resolved, or convert to permanent block if IP is confirmed malicious

## 6. Reporting
- Log incident with timestamp, source, affected account, actions taken, and resolution
- Escalate to Network Security Engineer / management if part of a broader pattern (e.g. same source IP hitting multiple accounts/services)
- Update detection rule/threshold if the alert logic needs tuning (too noisy or missed variant)

## 7. Post-Incident Review Checklist
- [ ] Root cause documented
- [ ] Was the alert threshold appropriate? Adjust if needed
- [ ] Was MFA enforced on the affected account? If not, flag for policy review
- [ ] Any indicators that should be added to threat intel / watchlist
- [ ] Lessons learned shared with team

---
*Playbook maintained as part of SOC alert-handling procedures. Aligned to general incident-handling practice (detect → triage → contain → eradicate → recover → report).*
