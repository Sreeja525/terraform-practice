variable "ami_id"{
    type = string
    default = " ami-09c813fb71547fc4f "
    description = " AMI ID of join devops RHEL9 "
}

variable "instance_type"{
    type = string
    default = " t2.micro "

}

variable "ec2_tags"{
    type= map
    default = {
        Name = "Hello world "
    }
}

variable "sg_name"{
  default = " var-file-allow_all"
}

variable "from_port"{
    default = 0
}

variable "to_port"{
    default = 0
}

variable "protocol"{
    default = "-1"

}
variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks"{

    default = ["::/0"]
}