module "vpc" {
    source = "/mnt/f/devops/git_practice/repos/terraform-practice/aws-vpc"
    environment = var.environment
    project = var.project
    public_subnets = var.public_subnet_cidrs
  
}