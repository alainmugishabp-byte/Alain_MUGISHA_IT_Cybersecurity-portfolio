# Cisco Network & Security Administration

## Objective

Demonstrate practical Cisco networking and security administration skills.

## Activities

* Cisco IOS configuration
* VLAN configuration
* Inter-VLAN routing
* Access Control Lists (ACLs)
* Port security
* Secure management access
* SSH configuration
* Routing configuration
* DHCP configuration
* Network troubleshooting
* Device hardening
* Network monitoring

## Security Examples

### ACL

```text
access-list 100 deny ip <source> <destination>
access-list 100 permit ip any any
```

### Secure Management

```text
ip domain-name lab.local
crypto key generate rsa
line vty 0 4
transport input ssh
```

## Laboratory Evidence

* Cisco Packet Tracer topology
* Cisco IOS configurations
* ACL examples
* VLAN configurations
* Security validation
* Troubleshooting procedures
