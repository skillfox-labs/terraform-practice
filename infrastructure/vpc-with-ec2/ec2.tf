#
# ec2.tf - Property of Skillfox Labs LLC
#

data "aws_ami" "centos" {
  most_recent = true
  owners      = ["aws-marketplace"]

  filter {
    name   = "name"
    values = ["CentOS Linux 7 x86_64 HVM EBS*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_key_pair" "zombie" {
  key_name   = "zombie-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC5ddzM+c7Yx1bXk84Tp0rCuhhAOfBxwlaVurUqExEwm5bFweAwxkg574Du7C+bRrlrCxDLKQwBQTGKlyxVYF/Dv7SG9mBYqxivqVqXdx7b59/pGmEJd9kU3QpaVBrUiG2OiBEcsd2cuR5yYcS1tufvt5wjQJ0WLIlYsOIiStLgUwteBCuBKKWcZpP7r4x6ifWZhO422nNQu0fu2iik5tUhZTQ47M/8gg+ZAUWbiw2eWKJZrYTOvJ2SSSUPPzJWB1OhedLKTqZ8LCQPLdMEOJHlJ+UhmDqnRlNuVZf4XqX1SEAFuGt1sUZlP421r28XBmRsjR5o6CUp7LALFrNXjybl james@Zombie"
}

resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.micro"
  key_name                    = "${aws_key_pair.zombie.key_name}"
  subnet_id                   = "${aws_subnet.subnet_public_az_a.id}"
  vpc_security_group_ids      = ["${aws_security_group.sg_http_ssh.id}"]
  associate_public_ip_address = false

  volume_tags = {
    Name = "Bastion Host"
  }

  tags = {
    Name = "Bastion Host"
  }
}
