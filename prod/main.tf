terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-east-1"
}

resource "aws_instance" "app_server" {
  count = var.num_inst
  ami           = "ami-04a81a99f5ec58529"
  instance_type = var.ins_type

  tags = {
    Name = var.environment
  }
}
