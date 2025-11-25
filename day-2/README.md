# Deploying VPCs
- Make the VPC
- Make the subnets
- Make the route table(s)
    - Associate the route table(s)
    - e.g. public rt to allow 0.0.0.0/0 connection, while private subnet has no internet connection at all
- Make the IGW
    - Attach it to the VPC
- Edit routes so 0.0.0.0/0 uses the IGW
- Launch instances inside subnets
    - e.g. private db, public app


### Removal Order
- Terminate instances inside VPC
- Delete the SGs in the VPC
- Delete the VPC
    - This will delete all remaining components at the same time (IGW, RTs, Subnets)

