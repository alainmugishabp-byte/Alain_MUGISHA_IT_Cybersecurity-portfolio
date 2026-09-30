# Test Results: Firewall Policies

Fill in **Actual** and **Pass/Fail** after running each test in your lab. Do not pre-fill.

| # | Test | Expected | Actual | Pass/Fail | Screenshot |
|---|------|----------|--------|-----------|------------|
| 1 | PC in vlan10: curl https://example.org | Allowed (policy 1) |  |  |  |
| 2 | PC in vlan10: curl https://10.10.50.10 | Allowed (policy 2) |  |  |  |
| 3 | PC in vlan10: nc -zv 10.10.20.10 3306 | Blocked (only web server may use 3306) |  |  |  |
| 4 | Web server to DB on 3306 | Allowed (policy 3) |  |  |  |
| 5 | External host to VIP on 443 | Allowed, DNAT to 10.10.50.10 |  |  |  |
| 6 | External host to VIP on 22 | Blocked (policy 999) |  |  |  |
| 7 | GUI Policy Lookup for each case | Matches the expected policy ID |  |  |  |
