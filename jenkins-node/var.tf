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
    default = "vpc-0d00cbf10934aa517"
}

variable "subnet" {
    default = "subnet-06ce8a1f98518b16e"
}

variable "securityGroups" {
   type = list
   default = [ "sg-0e0095c2522e35eb2" ]
}