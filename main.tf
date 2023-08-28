terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.13.1" # Use an appropriate version number
    }
  }
}

provider "aws" {
  alias      = "main"
  access_key = "AKIAXIW2BXF4HYU26QZ3"
  secret_key = "UWUt0gHtB0i47SElpAjPgNUDDb6b0B8TIHG+EY33"
}

resource "aws_instance" "example" {
  ami           = "ami-0ccabb5f82d4c9af5"
  instance_type = "t2.medium"
}

resource "aws_s3_bucket" "example" {
  bucket = "my-unique-tf-bucket" # Choose a unique bucket name
}