#
# output.tf - Property of Skillfox Labs LLC
#

output "vpc_id" {
  value = "${aws_vpc.main.id}"
}

output "subnet_public_az_a_id" {
  value = "${aws_subnet.subnet_public_az_a.id}"
}

output "sg_http_ssh" {
  value = "${aws_security_group.sg_http_ssh.id}"
}

output "default_route_id" {
  value = "${aws_default_route_table.default_route.id}"
}
