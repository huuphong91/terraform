variable "ami_id" {}
variable "instance_type" {}
variable "subnet_id" {
    type = string
}
variable "key_name" {}
variable "count_ec2" {}
variable "count_eip" {}