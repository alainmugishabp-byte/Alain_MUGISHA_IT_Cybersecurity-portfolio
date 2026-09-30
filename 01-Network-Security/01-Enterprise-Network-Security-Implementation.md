# 1. Network Security: Enterprise Network Security Implementation

**Goal:** Show an end-to-end secured network: segmentation, filtering, and monitoring working together.

**Steps**
1. **Build the topology:** Internet (cloud/NAT) → FortiGate → core switch → VLANs 10/20/30/40/50.
2. **Create VLAN interfaces on FortiGate** (repeat per VLAN):
   ```
   config system interface
     edit "vlan10"
       set vdom "root"
       set interface "port2"
       set vlanid 10
       set ip 10.10.10.1 255.255.255.0
       set allowaccess ping
     next
   end
   ```
3. **Define zones and trust levels:** e.g. Users = medium, Servers = high, Management = highest, Guest = untrusted, DMZ = semi-trusted.
4. **Write a traffic matrix** (who may talk to whom, on which ports). This is your security policy on paper, and it's a strong portfolio artifact.
5. **Enforce it** with firewall policies (Project 2) and switch ACLs (Project 10).
6. **Enable security profiles** (web filter, application control, IPS, antivirus where licensed) on Users→Internet policies.
7. **Enable logging** to FortiAnalyzer (Project 8).
8. **Test:** Users can browse; Guest cannot reach Servers; Servers cannot initiate to Users; Management is reachable only from admin PC.

**Evidence to commit:** architecture diagram, traffic matrix table, policy list, test-result table, screenshots of blocked traffic logs.

---

*Lab addressing and tools: see [`../00-Lab-Setup.md`](../00-Lab-Setup.md).*
