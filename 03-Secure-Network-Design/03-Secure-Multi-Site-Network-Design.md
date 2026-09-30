# 3. Secure Network Design: Multi-Site Design

**Goal:** A design document, not just configs; shows you can think like an architect.

**Steps**
1. **Gather (assumed) requirements:** 2 sites, ~200 users HQ, ~30 branch, public web server, guest Wi-Fi, compliance mindset (least privilege, logging).
2. **Choose the design model:** Internet → Edge Firewall → Core → Distribution/Access → VLANs. Branch connects by site-to-site VPN.
3. **Define security zones:** Untrusted (Internet, Guest), DMZ, Internal User, Server, Management.
4. **Design decisions to document (with justification):**
   - Why segmentation (limit lateral movement)
   - Dedicated management VLAN, out-of-band if possible
   - Redundancy option (HA pair of FortiGates, dual ISP), even if only described
   - Logging/monitoring placement
   - IP plan and routing (static or OSPF)
5. **Draw 3 diagrams in Draw.io:** physical/logical topology, zone/security diagram, traffic-flow diagram.
6. **Write a risk section:** top threats (phishing, lateral movement, exposed services, insider) and which design control mitigates each.
7. **Export diagrams as PNG** and keep the `.drawio` source in the repo.

**Evidence:** the three diagrams, IP/VLAN table, zone matrix, design-justification document (2–4 pages).

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
