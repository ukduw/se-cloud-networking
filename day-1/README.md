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
Describes a range of available IP Adresses, with given wideness. 

CIDR blocks are denoted by **IP/length**, e.g.
- 10.0.0.0 **/16**
- The **/number** can be up to **-8, -16, -24, -32**
    - This indicates **how many bits are fixed**
- e.g. 10.0.0.0/16 = **65,536 private IPs**
    - from 10.0.0.0 to 10.0.255.255

![CIDR ranges](CIDR-ranges.png)

- **/8** = ~16mil IPs
- **/16** = 65,536
- **/20** =  4,096
- **/24** = 256
- **/32** = 1

The CIDR block defines the size of the VPC's IP address space.
- e.g. **VPC CIDR**: 10.0.0.0/16

Then, **divided into subnets**:
- **Subnet A**: 10.0.1.0/24
- **Subnet B**: 10.0.2.0/24
- **Subnet C**: 10.0.3.0/24

The VPC's CIDR block must be the **widest**, so the CIDR blocks of **its subnets can be within it**. The VPC CIDR must be large enough for subnets across AZs, instances, databases...

**Two peered (network connected) VPCs cannot overlap IP ranges**


### IP Addresses


### Subnets


### Gateways


### Route Tables


### Security Groups (SGs) and Network Access Control Lists (NACLs)


### DNS


### Route53


### VPC designs

