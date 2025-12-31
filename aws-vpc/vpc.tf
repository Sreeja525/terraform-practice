# VPC roboshop-dev
resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"
  enable_dns_hostnames = true

  tags = merge(
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
    local.common_tags,
    
    {
    Name = "${var.project}-${var.environment}"
  }
  )
}

#create two public subnets name should be roboshop-dev-us-east-1a and 1b

resource "aws_subnet" "public" {
  count = length(var.public_subnets)
  vpc_id     = aws_vpc.main.id
  
  cidr_block = var.public_subnets[count.index]

  tags = merge(
    local.common_tags,
    {
    Name = "${var.project}-${var.environment}"
  }
  )
}