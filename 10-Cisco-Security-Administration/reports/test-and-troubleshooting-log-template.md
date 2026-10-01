# Test and Troubleshooting Log

## Verification commands
`show vlan brief` | `show interfaces trunk` | `show ip interface brief` | `show access-lists` | `show port-security interface f0/1` | `show interfaces status err-disabled` | `show ip ssh` | `show ip ospf neighbor`

## Tests
| # | Test | Expected | Actual | Pass/Fail |
|---|------|----------|--------|-----------|
| 1 | PC1 pings Server | Fails ICMP (ACL), HTTP works |  |  |
| 2 | PC1 browses http://10.10.20.10 | Works |  |  |
| 3 | Connect rogue PC to port-security port | Port err-disabled |  |  |
| 4 | Telnet to switch | Refused |  |  |
| 5 | SSH to switch with correct credentials | Works |  |  |
| 6 | 4 failed SSH logins | Login blocked for 120 s |  |  |

## Troubleshooting exercises (break it on purpose, then fix it)
| # | Fault introduced | Symptom | Commands used | Root cause | Fix |
|---|------------------|---------|---------------|------------|-----|
| 1 | Remove VLAN 20 from trunk |  |  |  |  |
| 2 | Put ACL permit below deny |  |  |  |  |
| 3 | Wrong OSPF key on one side |  |  |  |  |
