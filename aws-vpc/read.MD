# VPC Module
this module is devoloped for our project. Our project follows this module to create VPC

## Inputs
* Project(required) - Users should specify their project name
* environment (reqired) - Users should specify their environment
* cidr-block (optional) - User can provide their CIDR block. Default is 10.0.0.0/16

## outputs
* vpc_id - Exports VPC ID created