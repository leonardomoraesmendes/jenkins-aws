terraform {
  backend "s3" {
    bucket = "jenkins-state-demo"
    key    = "jenkins-master.tfstate"
    region = "us-east-1"
  }
}
provider "aws" {
        version    = "~> 2.0"
        region     = var.region
}