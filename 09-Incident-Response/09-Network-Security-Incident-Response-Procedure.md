# 9. Incident Response: Procedure and Simulation

**Goal:** Demonstrate a structured process using NIST SP 800-61 phases.

**Scenario (lab-simulated):** An internal PC (10.10.10.50) is compromised by malware and begins (a) beaconing to an external IP and (b) scanning the server VLAN. Simulate with a script that makes repeated outbound connections and an `nmap` run from that host in the lab.

**Phases and what to document**
1. **Preparation:** IR roles, contact list, severity levels, tools, log sources, backups.
2. **Detection and analysis:**
   - FortiAnalyzer alert: unusual destination / IPS port-scan event
   - Confirm in logs: source IP, timeline, ports, volume
   - Classify severity (e.g. High) and open an incident ticket
3. **Containment:**
   - Short-term: quarantine the host (FortiGate quarantine/ban user, move port to isolated VLAN, or a deny policy for 10.10.10.50)
   - Block malicious destination IP/domain on the firewall
4. **Eradication:** remove malware, reset credentials, patch the exploited weakness, check for lateral movement (did servers get touched?).
5. **Recovery:** restore from clean image, re-enable network access, monitor closely for 48–72 hours.
6. **Post-incident:** lessons learned, timeline, root cause, control improvements.

**Incident report template**

```
Incident ID / Date / Reporter
Severity and category
Summary
Timeline (time → event → source)
Affected systems
Detection method
Containment actions
Eradication and recovery actions
Root cause
Evidence references (log IDs, screenshots)
Lessons learned / corrective actions (owner, due date)
```

**Evidence:** IR procedure doc, flowchart, simulated log screenshots, completed incident report, containment config.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
