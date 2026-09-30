# 2. Firewall Configuration: FortiGate Policy Management

**Goal:** Demonstrate clean, least-privilege firewall policy design.

**Steps**
1. **Address objects** (use names, not raw IPs):
   ```
   config firewall address
     edit "NET_USERS"
       set subnet 10.10.10.0 255.255.255.0
     next
     edit "SRV_WEB"
       set subnet 10.10.50.10 255.255.255.255
     next
   end
   ```
2. **Address groups and custom services** (e.g. `SRV_WEB` + `SRV_DB` group; service for TCP 8443).
3. **Policies** (order matters, most specific first, implicit deny last):
   ```
   config firewall policy
     edit 1
       set name "Users-to-Internet"
       set srcintf "vlan10"
       set dstintf "wan1"
       set srcaddr "NET_USERS"
       set dstaddr "all"
       set action accept
       set schedule "always"
       set service "HTTP" "HTTPS" "DNS"
       set nat enable
       set logtraffic all
     next
     edit 2
       set name "Users-to-WebServer"
       set srcintf "vlan10"
       set dstintf "vlan50"
       set srcaddr "NET_USERS"
       set dstaddr "SRV_WEB"
       set action accept
       set schedule "always"
       set service "HTTPS"
       set logtraffic all
     next
   end
   ```
4. **Destination NAT (VIP)** to publish the DMZ web server:
   ```
   config firewall vip
     edit "VIP_WEB_443"
       set extintf "wan1"
       set extip 203.0.113.1
       set mappedip "10.10.50.10"
       set portforward enable
       set protocol tcp
       set extport 443
       set mappedport 443
     next
   end
   ```
   Then create a policy `wan1 → vlan50` with `dstaddr "VIP_WEB_443"`.
5. **Explicit deny-all with logging** at the bottom (policy ID 999) so blocked traffic appears in logs.
6. **Test each policy** using ping, `curl`, `nc -zv host port`, and **Policy Lookup** in the GUI. Capture before/after screenshots.
7. **Document** a policy table: ID, name, source, destination, service, action, NAT, logging, business reason.

**Evidence:** sanitized `show firewall policy` output, policy table, test screenshots, forward-traffic logs showing accept and deny.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
