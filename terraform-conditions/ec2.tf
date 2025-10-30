resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.environment== "dev" ? "t2.micro" : "t3.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]


  tags = {
    Name = "var.tags"
  }

}

resource "aws_security_group" "allow_all" {
  name        = var.Name
  description = "Allow all traffic"
 

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol 
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol 
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = var.ipv6_cidr_blocks
  }

  tags = {
    Name = "allow_all"
  }
}