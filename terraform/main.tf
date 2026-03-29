provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-0c3389a4fa5bddaad"
  instance_type = "c7i-flex.large"

  tags = {
    Name = "DevOps-Server"
  }
}
