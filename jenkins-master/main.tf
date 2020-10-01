resource "aws_key_pair" "localkey" {
  key_name   = "jenkins"
  public_key = file(var.keyPath)
}

resource "aws_instance" "jenkins-lab" {
  ami                           = var.ami
  instance_type                 = var.itype
  subnet_id                     =  var.subnet
  associate_public_ip_address   = "true"
  security_groups               = var.securityGroups
  key_name                      = aws_key_pair.localkey.key_name
  iam_instance_profile          = aws_iam_instance_profile.Jenkins_profile.name

  root_block_device {
    delete_on_termination       = true
    iops                        = 150
    volume_size                 = 50
    volume_type                 = "gp2"
  }

  provisioner "file" {
    source      = "Dockerfile"
    destination = "/tmp/Dockerfile"
  }
  provisioner "file" {
    source      = "./provision.sh"
    destination = "/tmp/provision.sh"
  }
  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provision.sh",
      "sudo /tmp/provision.sh",
    ]
  }
  connection {
    type        = "ssh"
    user        = "ubuntu"
    password    = ""
    private_key = file(var.KeyPrivate)
    host        = self.public_ip
  }
}


output "ec2instance" {
  value = aws_instance.jenkins-lab.public_ip
}