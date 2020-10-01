variable "availability_zones" {
   type = list
   default = [ "us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d" ]
}

variable "region" {
    default = "us-east-1"
}

variable "ami" {
    default = "ami-0ac80df6eff0e70b5"
}

variable "itype" {
    default = "t2.medium"
}

variable "keyName" {
   default = "jenkins"
}

variable "KeyPrivate" {
    default = "~/.ssh/id_rsa"
}

##
## Preencher variaveis abaixo conforme output do baseline
##


variable "vpc" {
    default = "vpc-0b0646088bac8144b"
}

variable "subnet" {
    default = "subnet-0d3b66ac9f42579fc"
}

variable "securityGroups" {
   type = list
   default = [ "sg-0182ccc23af605329" ]
}