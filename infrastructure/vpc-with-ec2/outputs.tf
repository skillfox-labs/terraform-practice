#
# output.tf - Property of Skillfox Labs LLC
#

output "vpc_id" {
  value       = "${aws_vpc.main.id}"
  description = "VPC ID."
}

output "vpc_cidr_block" {
  value       = "${aws_vpc.main.cidr_block}"
  description = "VPC cidr block used."
}

output "igw_id" {
  value       = "${aws_internet_gateway.igw.id}"
  description = "ID of the internet gateway."
}

output "kms_mykey_id" {
  value       = "${aws_kms_key.mykey.key_id}"
  description = "KMS Key id."
}

output "kms_mykey_arn" {
  value       = "${aws_kms_key.mykey.arn}"
  description = "KMS Key ARN."
}

output "subnet_public_az_a_id" {
  value       = "${aws_subnet.subnet_public_az_a.id}"
  description = "Public Subnet for AZ-A id."
}

output "sg_http_ssh_id" {
  value       = "${aws_security_group.sg_http_ssh.id}"
  description = "Security Group id for http/ssh."
}

output "default_route_id" {
  value       = "${aws_default_route_table.default_route.id}"
  description = "VPC's default routetable id."
}

output "web_eip" {
  value       = "${aws_eip.web_eip.public_ip}"
  description = "Elastic IP fo the web instance."
}

output "web_ami_id" {
  value       = "${aws_instance.web.ami}"
  description = "Web EC2 Instance AMI."
}

output "s3_state_bucket_name" {
  value       = "${aws_s3_bucket.state_bucket.id}"
  description = "State bucket name."
}

output "s3_state_bucket_arn" {
  value       = "${aws_s3_bucket.state_bucket.arn}"
  description = "State bucket ARN."
}
