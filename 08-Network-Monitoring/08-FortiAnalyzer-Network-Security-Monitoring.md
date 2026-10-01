# 8. Network Monitoring: FortiAnalyzer

**Goal:** Central logging, dashboards, alerts, and a monitoring routine.

**Steps**
1. **Deploy FortiAnalyzer VM** on the management VLAN (e.g. 10.10.30.20); set hostname, time, admin password.
2. **Send logs from FortiGate:**
   ```
   config log fortianalyzer setting
     set status enable
     set server 10.10.30.20
     set upload-option realtime
     set reliable enable
   end
   ```
3. **Authorize the device** in FortiAnalyzer (*Device Manager → Unauthorized Devices*).
4. **Make sure policies log** (`set logtraffic all`) and security profiles log.
5. **Generate traffic:** browse, run a port scan from Kali, try blocked sites, fail some logins.
6. **Use the tools:** *FortiView* (top sources, destinations, applications, threats), *Log View* (filter by `action=deny`, `srcip=`), *Event Management* (create alert handlers, e.g. repeated failed admin logins, IPS critical events).
7. **Schedule a report** (daily/weekly security summary) from built-in templates.
8. **Write the monitoring procedure (SOP):**
   - Daily: review top threats, denied traffic spikes, admin logins
   - Weekly: review report, tune alerts
   - Escalation: which alert → who → how fast (links to Project 9)
9. **Document baselines** (normal traffic volume, top apps) so anomalies are visible.

**Evidence:** dashboard screenshots, log filter examples, alert rule screenshots, sample report, SOP document.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
