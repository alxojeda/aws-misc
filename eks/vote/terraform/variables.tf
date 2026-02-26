variable "vpc_id" {}

variable "gateway_id" {}

variable "public_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

