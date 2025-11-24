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
Unique identifiers for each device on a network. 

**IPv4** (numeric dot notation)
- 4 Numbers (0-255), representing 32bits
- 4.3bil unique addresses
- e.g. 192.168.0.1

**IPv6** (alphanumeric hexadecimal notation)
- 128bit address
- 7.9x10^28 unique addresses (**effectively unlimited**)
- 50b2:6400:0000:0000:6c3a:b17d:0000:10a9

**Each IP address has two parts**:
- **Network portion** - which network the device belongs to
- **Host portion** - which specific device (host) in the network it is

**A subnetmask / CIDR determines how many bits belong to each part.**

**Reserved IP ranges**:
- Private use IP ranges:
    - 10.0.0.0/8
    - 172.16.0.0/12
    - 192.168.0.0/16
- Other reserved ranges:
    - 127.0.0.0/8 (loopback)
    - 169.254.0.0/16 (link-local)
    - 224.0.0.0/4 (multicast)
    - 240.0.0.0/4 (future use)
    - 100.64.0.0/10 (carrier-grade NAT)

**NATs** (Network Address Translation)   
A method used by routers to rewrite IP addresses on packets in transit.
- **Allows multiple devices on a private network to share a single public IP address to connect to the internet**
- This conserves public IPv4 addresses and provides a layer of security by **hiding the private IP addresses from the public network**


### Subnets


### Gateways


### Route Tables


### Security Groups (SGs) and Network Access Control Lists (NACLs)


### DNS


### Route53


### VPC designs

