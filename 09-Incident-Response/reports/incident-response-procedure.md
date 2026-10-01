# Network Security Incident Response Procedure

## 1. Roles
| Role | Responsibility |
|---|---|
| Incident Lead | Owns the incident, decides containment, communicates |
| Network Analyst | Log analysis, firewall containment |
| System Owner | Rebuilds/restores affected systems |
| Management contact | Approvals and external communication |

## 2. Severity
- **Critical:** active compromise of servers/data
- **High:** compromised workstation with lateral movement or C2
- **Medium:** policy violation, suspicious but unconfirmed
- **Low:** isolated, no impact

## 3. Scenario
Workstation 10.10.10.50 beacons to an external host and scans the Servers VLAN (simulated with `configs/lab-simulation.sh`).

## 4. Phases
1. **Detection:** FortiAnalyzer alert (repeated outbound to rare IP; IPS port-scan). Confirm in Log View: source, destination, ports, timeline.
2. **Analysis:** determine scope. Did the host touch servers? Any successful connections? Open a ticket, set severity High.
3. **Containment:** apply `configs/containment-commands.conf`; isolate the host port/VLAN; preserve logs.
4. **Eradication:** reimage or clean host, reset credentials used on it, patch root cause, scan servers for signs of access.
5. **Recovery:** restore from a clean image, reconnect, monitor 48-72 hours.
6. **Post-incident:** complete the report template; update rules and awareness.

## 5. Evidence handling
Export relevant logs (time range, filters used) and keep them with the ticket. Record who did what and when.
