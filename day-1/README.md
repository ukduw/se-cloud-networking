# Virtual Private Clouds (VPCs)
Isolated, private section of a public cloud, allowing for greater control. VPCs provide:
- **IP Address space** (private network range)
- **Subnets** (smaller networks inside the VPC)
- **Routing** (route tables decide how traffic flows)
- **Security** (firewalls, SGs, NACLs)
- **Gateways** (internet + NAT (Network Address Translation) gateways, VPN...)

![VPC structure](VPC.gif)

**VPCs are IaaS.**


### Classless Inter-Domain Routing (CIDR)
Range of available IP Adresses, described by wideness. The VPC's CIDR block must be the widest, so the CIDR blocks of any subnets can be within them.

CIDR blocks are denoted by IPs, e.g.
- 10.0.0.0/16
- The digits are denoted by 8, 16, 24, 32


### IP Addresses


### Subnets


### Gateways


### Route Tables


### Security Groups (SGs) and Network Access Control Lists (NACLs)


### DNS


### Route53


### VPC designs

