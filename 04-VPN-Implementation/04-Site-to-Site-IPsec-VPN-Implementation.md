# 4. VPN Setup: Site-to-Site IPsec

**Goal:** Working encrypted tunnel HQ ↔ Branch with routing and proof.

**Topology:** HQ FortiGate (203.0.113.1) ↔ Internet cloud ↔ Branch FortiGate (198.51.100.1).

**Steps (HQ side; mirror on Branch with swapped values)**
1. **Phase 1 (IKEv2, AES-256, SHA-256, DH group 14):**
   ```
   config vpn ipsec phase1-interface
     edit "HQ-to-BR"
       set interface "wan1"
       set ike-version 2
       set remote-gw 198.51.100.1
       set proposal aes256-sha256
       set dhgrp 14
       set psksecret <PSK>
       set dpd on-idle
     next
   end
   ```
2. **Phase 2 (only the subnets that need to talk):**
   ```
   config vpn ipsec phase2-interface
     edit "HQ-to-BR-P2"
       set phase1name "HQ-to-BR"
       set proposal aes256-sha256
       set pfs enable
       set dhgrp 14
       set src-subnet 10.10.10.0 255.255.255.0
       set dst-subnet 10.20.10.0 255.255.255.0
     next
   end
   ```
3. **Routing:**
   ```
   config router static
     edit 10
       set dst 10.20.10.0 255.255.255.0
       set device "HQ-to-BR"
     next
     edit 11
       set dst 10.20.10.0 255.255.255.0
       set blackhole enable
       set distance 254
     next
   end
   ```
   (The blackhole route prevents leaking traffic to the Internet if the tunnel drops.)
4. **Firewall policies (both directions, NAT disabled):** `vlan10 → HQ-to-BR` and `HQ-to-BR → vlan10`.
5. **Verify:**
   ```
   diagnose vpn ike gateway list
   diagnose vpn tunnel list
   get vpn ipsec tunnel summary
   ```
   Then ping from PC in 10.10.10.0/24 to 10.20.10.0/24 and run a traceroute.
6. **Prove encryption:** capture on the WAN link in Wireshark; show ESP packets (payload unreadable) versus plaintext ICMP on the LAN side.
7. **Failure test:** shut the WAN interface, confirm the tunnel drops and the blackhole route engages; restore and confirm auto-reconnect.

**Evidence:** topology diagram, Phase 1/2 settings table (sanitized, no PSK), tunnel-up screenshots, Wireshark capture, ping/traceroute results.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
