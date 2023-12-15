variable "name" {
  description = "The name of the VPC"
}

variable "cidr" {
  description = "The CIDR block for the VPC"
}

variable "azs" {
  description = "The list of availability zones"
  type        = list(string)
}

variable "private_subnets" {
  description = "The list of private subnet CIDR blocks"
  type        = list(string)
}

variable "public_subnets" {
  description = "The list of public subnet CIDR blocks"
  type        = list(string)
}

variable "enable_nat_gateway" {
  description = "Enable NAT gateway for private subnets"
  type        = bool
}

variable "single_nat_gateway" {
  description = "Use a single NAT gateway for all private subnets"
  type        = bool
}