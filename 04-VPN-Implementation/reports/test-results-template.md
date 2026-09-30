# Test Results: IPsec VPN

Fill in **Actual** and **Pass/Fail** after running each test in your lab. Do not pre-fill.

| # | Test | Expected | Actual | Pass/Fail | Screenshot |
|---|------|----------|--------|-----------|------------|
| 1 | Phase 1 status | Up |  |  |  |
| 2 | Phase 2 selectors | Up with 10.10.10.0/24 <-> 10.20.10.0/24 |  |  |  |
| 3 | HQ PC pings Branch PC | Replies |  |  |  |
| 4 | Traceroute path | Goes through tunnel |  |  |  |
| 5 | Wireshark on WAN link | ESP packets, no readable payload |  |  |  |
| 6 | Shut WAN interface | Tunnel goes down; traffic does not leak to Internet |  |  |  |
| 7 | Restore WAN | Tunnel re-establishes automatically |  |  |  |
