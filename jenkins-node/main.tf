resource "aws_instance" "linux_instance" {
  ami             = var.ami
  subnet_id       = var.subnet
  security_groups = var.securityGroups 
  key_name        = var.keyName 
  instance_type   = var.itype 

  root_block_device {
    volume_type = "gp2"
    volume_size = 50
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


resource "null_resource" "terminate_instace" {
  depends_on = [aws_autoscaling_group.bar]
  provisioner "local-exec" {
    on_failure  = fail
    interpreter = ["/bin/bash", "-c"]
    command     = <<EOT
        echo -e "\x1B[31m Warning! Terminating instance having id ${aws_instance.linux_instance.id}.................. \x1B[0m"
        aws ec2 terminate-instances --instance-ids ${aws_instance.linux_instance.id}
        echo "***************************************Rebooted****************************************************"
     EOT
  }

  triggers = {
    always_run = "${timestamp()}"
  }

}