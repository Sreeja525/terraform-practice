resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = "t2.micro"
  vpc_security_group_ids = [ aws_security_group.allow_all.id ]

  connection {
    type        = "ssh"
    user        = "ec2-user" # Or appropriate user for your AMI
    password = "DevOps321" # Path to your private key
    host        = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }
  provisioner "remote-exec"{
    when = destroy
    inline = [
      "sudo systemctl stop nginx"
    ]
  }

  tags = {
    Name = "Helloworld"
  }
}

resource "aws_security_group" "allow_all" {
  name        = var.sg_name
  description = var.sg_description
 

  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]
  }
  egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1" 
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks =  ["::/0"]
  }

  tags = {
    Name = var.sg_name
  }
}