# Network Security Monitoring Procedure (SOP)

## Daily (10-15 min)
1. Check FortiAnalyzer dashboard: log rate normal, all devices reporting.
2. FortiView: top sources, destinations, applications, threats compared with baseline.
3. Log View filters: `action=deny` spikes, admin login failures, IPS High/Critical.
4. Record anything unusual in the monitoring log.

## Weekly
1. Review the scheduled security report.
2. Tune alert thresholds to cut false positives.
3. Check disk usage and log retention.

## Alert escalation
| Severity | Example | Response time | Action |
|---|---|---|---|
| Critical | Confirmed compromise, IPS critical on server | 15 min | Start incident response (Project 9) |
| High | Port scan from internal host | 1 hour | Investigate and contain if confirmed |
| Medium | Repeated failed admin logins | 4 hours | Verify source; lock account if needed |
| Low | Policy deny of known app | Next business day | Review/adjust policy |

## Baseline (fill in from your lab)
Normal daily traffic volume: ___  Top 3 applications: ___  Usual admin login times: ___
