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
    default = "vpc-051a38e88cde01621"
}

variable "subnet" {
    default = "subnet-0830e49a56e719680"
}

variable "securityGroups" {
   type = list
   default = [ "sg-02aa9b8b1b219de80" ]
}
