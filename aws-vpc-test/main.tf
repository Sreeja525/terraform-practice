module "vpc" {
    source = "/mnt/f/devops/git_practice/repos/terraform-practice/aws-vpc"
    environment = "dev"
    project = "roboshop"
    public_subnets = var.public_subnet_cidrs
    private_subnets = var.private_subnet_cidrs
    database_subnets = var.database_subnet_cidrs


    is_peering_required = true

}
