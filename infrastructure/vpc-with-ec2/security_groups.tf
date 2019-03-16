#
# security_groups.tf - Property of Skillfox Labs LLC
#

resource "aws_default_security_group" "default" {
  vpc_id = "${aws_vpc.main.id}"

  ingress {
    description = "Any inbound connection between nodes with the same SG."
    protocol    = -1
    self        = true
    from_port   = 0
    to_port     = 0
  }
}

resource "aws_security_group" "sg_http_ssh" {
  name        = "sg_http_ssh"
  description = "HTTP and SSH ingress"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    description = "Allow HTTP inbound connections."
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow SSH inbound connections."
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow any outbound connections."
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_http_ssh"
  }
}
