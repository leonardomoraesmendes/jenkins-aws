variable "region" {
    default = "us-east-1"
}

variable "ami" {
    default = "ami-0ac80df6eff0e70b5"
}
variable "itype" {
    default = "t2.medium"
}

variable "keyPath" {
    default = "~/.ssh/id_rsa.pub"
}
variable "KeyPrivate" {
    default = "~/.ssh/id_rsa"
}

##
## Preencher variaveis abaixo conforme output do baseline
##

variable "vpc" {
    default = ""
}

variable "subnet" {
    default = ""
}

variable "securityGroups" {
   type = list
   default = [ "" ]
}
