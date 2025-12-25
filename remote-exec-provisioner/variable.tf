variable "ami_id"{
    type = string
    default = "ami-09c813fb71547fc4f"
    description = " AMI ID of join devops RHEL9 "
}

variable "instance_type"{
    type = string
    default = " t2.micro "

}



variable "sg_name"{

    default = " allow_all"
}

variable "sg_description"{

    default = " allow all traffic"
}

variable "from_port"{
    default = 0
}

variable "to_port"{
    default = 0
}


variable "cidr_blocks"{
    type = list(string)
    default = ["0.0.0.0/0"]
}

variable "ipv6_cidr_blocks"{

    default = ["::/0"]
}
variable "environment"{
    default= "dev"
}

variable "zone_id"{
    default = "Z02370613NFA2YD1CKRZ2"
}

variable "domain_name"{
    default = "sreeja.site"
}