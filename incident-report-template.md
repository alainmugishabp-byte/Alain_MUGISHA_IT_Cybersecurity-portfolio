# Security Incident Report — Template

*This is a generic template reflecting the reporting structure I use for incident documentation and stakeholder communication. All example values below are placeholders.*

## 1. Incident Summary
| Field | Detail |
|---|---|
| Incident ID | INC-2026-XXXX |
| Date/Time Detected | YYYY-MM-DD HH:MM (timezone) |
| Detected By | SOC / IDS-IPS alert / manual report |
| Severity | Critical / High / Medium / Low |
| Status | Open / Contained / Resolved / Closed |
| Reported By | [Role — e.g. Network Security Engineer] |

## 2. Description
Brief, factual description of what was observed — the alert/trigger, affected system(s) or subnet, and initial indicators.

> Example: FortiGate IPS triggered a high-severity alert for repeated failed authentication attempts against the remote-access VPN gateway from a single external source, exceeding the defined threshold within a 5-minute window.

## 3. Affected Assets
- System/segment: `<placeholder — e.g. DMZ web server>`
- Business impact: `<placeholder — e.g. none, service remained available>`

## 4. Timeline
| Time | Action |
|---|---|
| T+0 | Alert triggered / detected |
| T+X min | Triage started, severity confirmed |
| T+X min | Containment action taken (e.g. source IP blocked at firewall) |
| T+X min | Root cause identified |
| T+X min | Incident resolved / monitoring continued |

## 5. Root Cause
What caused the incident — misconfiguration, external attack, policy gap, etc.

## 6. Containment & Remediation Actions
- Immediate action taken (e.g. blocked source at firewall policy, disabled compromised account)
- Follow-up remediation (e.g. tightened lockout policy, patched vulnerability, updated IPS signature)

## 7. Recommendations
- Preventive measures to reduce recurrence
- Any policy, monitoring, or architecture changes proposed

## 8. Lessons Learned
Short note on what worked well in the response and what could improve for next time.

---
*Report prepared by: [Name] — [Role] | Reviewed by: [Manager/Lead]*
