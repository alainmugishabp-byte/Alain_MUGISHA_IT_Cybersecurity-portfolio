# Configuration Backup Procedure

1. FortiGate GUI: username menu > Configuration > Backup > Local PC, enable encryption with a password.
2. CLI alternative: `execute backup config tftp HQ-FGT-01-YYYYMMDD.conf <tftp-server-ip>`
3. Cisco: `copy running-config tftp:` (or `copy running-config startup-config` for local save).
4. Store encrypted backups outside the Git repo. Commit only sanitized excerpts.
5. Test a restore in the lab at least once and record the date.
