# VPC roboshop-dev
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(
    var.vpc_tags,
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}"
    }
  ) 
}

#IGW roboshop-dev
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id # association with VPC

  tags = merge(
    var.igw_tags,
    local.common_tags,
    
    {
    Name = "${var.project}-${var.environment}"
  }
  )
}

#create two public subnets name should be roboshop-dev-public-us-east-1a and 1b

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  
  cidr_block = var.public_subnets[count.index]
  availability_zone = local.az_names[count.index]
  map_public_ip_on_launch = true

  tags = merge(
    var.public_subnet_tags,
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-public-${local.az_names[count.index]}"
  }
  )
}

#create two private subnets name should be roboshop-dev-private-us-east-1a and 1b

resource "aws_subnet" "private" {
  count = length(var.private_subnets)
  vpc_id     = aws_vpc.main.id
  
  cidr_block = var.private_subnets[count.index]
  availability_zone = local.az_names[count.index]
 

  tags = merge(
    var.private_subnet_tags,
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-private-${local.az_names[count.index]}"
  }
  )
}

#create two database subnets name should be roboshop-dev-database-us-east-1a and 1b

resource "aws_subnet" "database" {
  count = length(var.database_subnets)
  vpc_id     = aws_vpc.main.id
  
  cidr_block = var.database_subnets[count.index]
  availability_zone = local.az_names[count.index]
 

  tags = merge(
    var.database_subnet_tags,
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-database-${local.az_names[count.index]}"
  }
  )
}

/* resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    var.public_route_table_tags,
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}-public"
  }
  )
}
 */

/* resource "aws_route" "public" {
  route_table_id            = aws_route_table..id
  destination_cidr_block    = "10.0.1.0/22"
  vpc_peering_connection_id = "pcx-45ff3dc1"
} */