variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "private_subnet_az_a_cidr" {
  default = "10.0.1.0/24"
}

variable "private_subnet_az_b_cidr" {
  default = "10.0.2.0/24"
}

variable "public_subnet_az_a_cidr" {
  default = "10.0.3.0/24"
}
variable "public_subnet_az_b_cidr" {
  default = "10.0.4.0/24"
}


variable "region" {
  default = "us-east-1"
}

variable "az_a" {
  default = "us-east-1a"
}

variable "az_b" {
  default = "us-east-1b"
}

variable "my_ip" {
  description = "Your public IP address"
  type        = string
}

