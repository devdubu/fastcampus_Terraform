terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
      version = "2.2.3"
    }
  }
}

provider "local" {
}

provider "awscc" {
  region = "ap-northeast-2"
}

resource "aws_vpc" "foo" {
    cidr_block = "10.1.0.0/16"
}

resource "local_file" "foo" {
    filename = "${path.module}/foo.txt"
    content  = "Hello World!"
}

data "local_file" "foo" {
    filename = "${path.module}/foo.txt"
}

output "vpc_foo" {
  value = aws_vpc.foo
}

output "file_foo" {
  value = data.local_file.foo
}
