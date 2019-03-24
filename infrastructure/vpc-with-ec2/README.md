# VPC with EC2

## Contains
* VPC
  * /16
* IGW
* Subnet
  * Public subnet
  * /20
* Route Table
  * Public Route table
    * Internet gateway -> 0.0.0.0/0
    * S3 VPC Endpoint
  * default rotue table
* Security Group
  * HTTP and SSH ingress
* S3
  * private acl
  * Server side encryption
    * KMS
* KMS
* EC2 Intance
  * Elastic IP attached

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| aws\_region | The AWS region. | string | `"us-west-2"` | no |

## Outputs

| Name | Description |
|------|-------------|
| default\_route\_id | VPC's default routetable id. |
| igw\_id | ID of the internet gateway. |
| kms\_mykey\_arn | KMS Key ARN. |
| kms\_mykey\_id | KMS Key id. |
| sg\_http\_ssh | Security Group id for http/ssh. |
| subnet\_public\_az\_a\_id | Public Subnet for AZ-A id. |
| vpc\_cidr\_block | VPC cidr block used. |
| vpc\_id | VPC ID. |
| web\_eip | Elastic IP fo the web instance. |
