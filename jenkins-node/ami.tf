resource "random_id" "id" {
	  byte_length = 8
}

resource "aws_ami_from_instance" "jenkins_agent" {
  name               = "jenkins_agent-AMI-${random_id.id.hex}"
  source_instance_id = aws_instance.linux_instance.id
}

resource "aws_launch_configuration" "as_conf" {
  name            = "jenkins_agent-LG"
  image_id        = aws_ami_from_instance.jenkins_agent.id
  instance_type   = "m4.xlarge"
  spot_price      = "0.100"
  security_groups = var.securityGroups 
  key_name        = var.keyName 
}

data "aws_subnet_ids" "subnetIDS" {
  vpc_id = var.vpc
}

resource "aws_autoscaling_group" "bar" {
  name                 = "jenkins_agent-ASG"
  launch_configuration = aws_launch_configuration.as_conf.name
  availability_zones   = var.availability_zones
  desired_capacity     = 0
  min_size             = 0
  max_size             = 20
  vpc_zone_identifier  = tolist(data.aws_subnet_ids.subnetIDS.ids)
}