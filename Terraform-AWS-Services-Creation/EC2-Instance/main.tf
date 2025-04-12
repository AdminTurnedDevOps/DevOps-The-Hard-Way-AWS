terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

resource "aws_instance" "" {
  ami           = var.ami
  instance_type = var.instance_type

  network_interface {
    network_interface_id = var.network_interface_id
    device_index         = 0
  }

  credit_specification {
    cpu_credits = "unlimited"
  }
}