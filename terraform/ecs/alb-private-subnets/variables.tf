variable "vpc_id" {}

variable "gateway_id" {}

variable "imagen_id" {}

variable "private_cidrs" {
  type = list(string)
}

variable "public_subnets" {
  type = list(string)
}

variable "azs" {
  type = list(string)
}

