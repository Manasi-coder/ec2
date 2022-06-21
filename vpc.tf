# Creating VPC,name, CIDR and Tags
resource "aws_vpc" "dev" {
cidr_block           = "10.0.0.0/16"
instance_tenancy     = "default"
enable_dns_support   = "true"
enable_dns_hostnames = "true"
enable_classiclink   = "false"
tags = {
Name = "dev"
}
}

# Creating Private Subnets in VPC
resource "aws_subnet" "dev-private-1" {
vpc_id                  = aws_vpc.dev.id
cidr_block              = "10.0.3.0/24"
map_public_ip_on_launch = "false"
availability_zone       = "ap-south-1a"
tags = {
Name = "dev-private-1"
}
}


