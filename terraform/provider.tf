terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.91.0"
    }
  }
 backend "s3" {
    bucket         = "bucketupgradcapstone"
    key            = "terraform/terraform.tfstate"
    region         = "us-east-1"
    #dynamodb_table = "terraform-locks" # Optional for state locking
  }
}

provider "aws" {
 region="us-east-1" # Configuration options
}
data "http" "my_ip" {
  url = "https://api.ipify.org"
}

locals {
  my_ip = "${chomp(data.http.my_ip.response_body)}/32"
}


