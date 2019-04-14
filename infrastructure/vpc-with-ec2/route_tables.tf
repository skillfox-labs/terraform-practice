#
# route_tables.tf - Property of Skillfox Labs LLC
#
# Creates:
#  - default_route - Route table is the table that comes with the VPC.
#  - public_route_table - Route table allows public internet access.
#   - Associates subnet_public_az_a subnet to this route table.
#   - Connect an S3 Endpoint to this route table.

#
# Default Route Table
#
resource "aws_default_route_table" "default_route" {
  default_route_table_id = "${aws_vpc.main.default_route_table_id}"

  tags = {
    Name = "default route table"
  }
}

#
# Custom Route Table
#
resource "aws_route_table" "public_route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.igw.id}"
  }

  tags = {
    Name = "Public Route table"
  }
}

resource "aws_route_table_association" "subnet_public_az_a" {
  subnet_id      = "${aws_subnet.subnet_public_az_a.id}"
  route_table_id = "${aws_route_table.public_route_table.id}"
}

#
# S3 Endpoint
#
resource "aws_vpc_endpoint" "s3" {
  vpc_id          = "${aws_vpc.main.id}"
  service_name    = "com.amazonaws.us-west-2.s3"
  route_table_ids = ["${aws_route_table.public_route_table.id}"]
}
