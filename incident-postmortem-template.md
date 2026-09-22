# Incident Postmortem — Template

*Reflects the postmortem structure I use after major incidents in NOC/infrastructure environments. Example values are placeholders — no real hostnames, IPs, or client data.*

## 1. Incident Overview
| Field | Detail |
|---|---|
| Incident ID | INC-2026-XXXX |
| Date | YYYY-MM-DD |
| Duration | Start HH:MM – End HH:MM (total downtime/impact time) |
| Severity | Critical (full outage) / High (major degradation) / Medium (partial impact) |
| Services Affected | `<placeholder — e.g. inter-site connectivity, VPN gateway, core switch>` |
| Incident Commander | [Role] |
| Bridge/Conference Called | Yes/No — participants: [roles, not real names if sensitive] |

## 2. Impact Summary
Plain-language description of what users/business functions experienced.

> Example: Inter-institutional connectivity between two sites was unavailable for approximately 45 minutes due to a core routing failure, affecting file transfer and VoIP services during business hours.

## 3. Timeline
| Time | Event |
|---|---|
| T+0 | Monitoring alert triggered / issue reported |
| T+X min | Incident acknowledged, bridge opened |
| T+X min | Initial diagnosis: `<placeholder>` |
| T+X min | Mitigation action taken: `<placeholder>` |
| T+X min | Service restored |
| T+X min | Incident closed, monitoring continued for stability |

## 4. Root Cause
Technical explanation of what actually failed — configuration error, hardware failure, capacity limit, third-party circuit issue, etc.

## 5. Detection
- How was the issue detected? (automated monitoring alert / user report / proactive check)
- Time from failure to detection — was this within target? If not, why?

## 6. Response Evaluation
**What went well:**
- e.g. Bridge assembled quickly, correct escalation path followed, clear communication to stakeholders

**What could improve:**
- e.g. Detection lag, unclear ownership at start, missing runbook for this failure type

## 7. Corrective Actions
| Action | Owner | Target Date | Status |
|---|---|---|---|
| e.g. Add redundant link on affected route | [Role] | YYYY-MM-DD | Open/Done |
| e.g. Update monitoring threshold for early warning | [Role] | YYYY-MM-DD | Open/Done |
| e.g. Document runbook for this failure scenario | [Role] | YYYY-MM-DD | Open/Done |

## 8. SLA Impact
- SLA breached? Yes/No
- Downtime vs. allowed threshold: `<placeholder>`
- Stakeholder communication sent: Yes/No — summary of what was communicated and when

---
*Postmortem is blameless by design — the goal is identifying process and system gaps, not individual fault.*
