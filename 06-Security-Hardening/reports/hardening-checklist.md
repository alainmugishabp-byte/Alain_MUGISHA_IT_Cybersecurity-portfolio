# Hardening Checklist

Tick only after verifying on your device and record the date.

## FortiGate
- [ ] Default admin renamed/disabled
- [ ] Trusted hosts set for every admin
- [ ] Management allowed only on the management interface
- [ ] HTTP and Telnet disabled on all interfaces
- [ ] WAN interface does not expose management
- [ ] TLS 1.2+ only, strong-crypto enabled
- [ ] Lockout threshold and admin timeout set
- [ ] Password policy enabled
- [ ] Login banner set
- [ ] NTP configured
- [ ] Logging to FortiAnalyzer enabled
- [ ] Unused interfaces/features disabled
- [ ] Backup taken and restore tested

## Cisco devices
- [ ] SSHv2 only, Telnet disabled
- [ ] Passwords encrypted, enable secret set
- [ ] HTTP server disabled
- [ ] Unused ports shut down and moved to a blackhole VLAN
- [ ] Banner and exec-timeout set
- [ ] Logging and NTP configured
