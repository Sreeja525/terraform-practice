variable "cidr_block" {
    default = "10.0.0.0/16"
}
variable "project" {
    default = "roboshop"
  
}
variable "environment" {
    default = "dev"
}

variable "public_subnets" {
    type = list(string)
  
}

variable "private_subnets" {
    type = list(string)
  
}
variable "database_subnets" {
    type = list(string)             #if you mentioning like this it can be mandatory to give for users
  
}

variable "vpc_tags" {
    type = map(string)
    default = {} # if you are mentioning like this passing tags becomes optional.
}

variable "igw_tags" {
    type = map(string)
    default = {}
}

variable "public_subnet_tags" {
    type = map(string)
    default = {}
  
}

variable "private_subnet_tags" {
    type = map(string)
    default = {}
  
}

variable "database_subnet_tags" {
    type = map(string)
    default = {}
  
}

variable "public_route_table_tags" {
    type = map(string)
    default = {}
  
}

variable "private_route_table_tags" {
    type = map(string)
    default = {}
  
}

variable "database_route_table_tags" {
    type = map(string)
    default = {}
  
}