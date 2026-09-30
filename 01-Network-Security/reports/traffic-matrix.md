# Traffic Matrix (Security Policy on Paper)

Rows = source zone, columns = destination zone. **A** = allowed (limited ports), **X** = denied.

| From \ To | Internet | Users | Servers | Mgmt | Guest | DMZ |
|---|---|---|---|---|---|---|
| Internet | n/a | X | X | X | X | A (TCP 443 to web server only) |
| Users | A (HTTP/HTTPS/DNS) | n/a | A (HTTPS only) | X | X | A (HTTPS) |
| Servers | A (updates only) | X | n/a | X | X | X |
| Mgmt | A | A (admin) | A (admin) | n/a | X | A (admin) |
| Guest | A (HTTP/HTTPS/DNS) | X | X | X | n/a | X |
| DMZ | X | X | A (DB port to specific host) | X | X | n/a |

Anything not listed as allowed is blocked by the final deny-all-with-logging policy.
