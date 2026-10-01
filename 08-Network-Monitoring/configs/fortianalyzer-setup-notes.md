# FortiAnalyzer Setup Notes
1. Deploy FortiAnalyzer-VM on VLAN 30 with IP 10.10.30.20/24.
2. Set hostname, timezone, NTP, and a strong admin password.
3. Device Manager > Unauthorized Devices > authorize the FortiGate.
4. Verify logs arrive: Log View > Traffic.
5. Event Management > Event Handlers: create handlers for
   - repeated failed admin logins
   - IPS events with severity High/Critical
   - denied traffic spike (for example, more than 500 denies in 5 minutes from one source)
6. Reports > Report Definitions > schedule a daily "Threat Report" and weekly "Security Analysis" (names vary by version).
