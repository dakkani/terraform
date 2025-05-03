# main.tf
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example" {
  ami           = "ami-005f0d81384686e83" # SLES AMI (us-east-1)
  instance_type = "t2.micro"

  tags = {
    Name = "Jenkins-Provisioned-Instance"
  }
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
