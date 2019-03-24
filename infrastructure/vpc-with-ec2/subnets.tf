#
# subnets.tf - Property of Skillfox Labs LLC
#

#
# Subnets
#
resource "aws_subnet" "subnet_public_az_a" {
  vpc_id            = "${aws_vpc.main.id}"
  cidr_block        = "10.0.0.0/20"
  availability_zone = "us-west-2a"

  tags = {
    Name = "Public Subnet - A"
  }
}
