terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"

  # cloud {
  #   organization = "jktam"

  #   workspaces {
  #     name = "james-workspace"
  #   }
  # }
}

provider "aws" {
  region                   = "us-west-2"
  shared_config_files      = ["~/.aws/config"]
  # shared_credentials_files = ["~/.aws/credentials"]
  profile = "dev"
}

resource "aws_instance" "app_server" {
  ami           = "ami-079f51a7bcca65b92"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}