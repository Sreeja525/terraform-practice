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
    type = list(string)
  
}
