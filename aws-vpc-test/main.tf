module "vpc" {
    source = "/mnt/f/devops/git_practice/repos/terraform-practice/aws-vpc"
    environment = "dev"
    project = "roboshop"
    public_subnets = var.public_subnet_cidrs
}