# 6. Security Hardening: FortiGate and Network Devices

**Goal:** Show you lock down the devices that protect the network.

**FortiGate steps**
1. **Restrict admin access by source (trusted hosts):**
   ```
   config system admin
     edit "netadmin"
       set accprofile "super_admin"
       set trusthost1 10.10.30.0 255.255.255.0
       set password <STRONG_PASSWORD>
     next
   end
   ```
2. **Disable default/unneeded admin and management exposure:** rename or disable default `admin`, allow management only on the management VLAN interface, and remove `http`, `telnet` from `allowaccess` everywhere:
   ```
   config system interface
     edit "vlan30"
       set allowaccess ping https ssh
     next
     edit "wan1"
       set allowaccess ping
     next
   end
   ```
3. **Global hardening:**
   ```
   config system global
     set admintimeout 10
     set admin-lockout-threshold 3
     set admin-lockout-duration 300
     set strong-crypto enable
     set admin-https-redirect enable
     set admin-https-ssl-versions tlsv1-2 tlsv1-3
     set hostname "HQ-FGT-01"
   end
   ```
4. **Password policy:**
   ```
   config system password-policy
     set status enable
     set minimum-length 12
     set min-upper-case-letter 1
     set min-number 1
     set min-non-alphanumeric 1
     set expire-status enable
     set expire-day 90
   end
   ```
5. **Set a login banner, NTP, and logging** (to FortiAnalyzer/syslog).
6. **Disable unused features** (unused interfaces, unused VPN/SSL-VPN portals, unused services).
7. **Backup config:** GUI (*Admin → Configuration → Backup*) or `execute backup config tftp <file> <server>`; store encrypted and **out of the repo**. Commit only a sanitized copy.

**Cisco device hardening (short list):** `service password-encryption`, `enable secret`, `no ip http server`, `transport input ssh`, `login block-for`, banner, disable unused ports, `no cdp run` on edge ports.

**Verification:** attempt login from a non-trusted host (should fail), nmap against the firewall WAN (only expected ports), run a hardening checklist (CIS-style) and tick each item.

**Evidence:** before/after checklist, sanitized config excerpts, failed-login screenshot, backup procedure.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
