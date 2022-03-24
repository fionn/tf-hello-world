locals {
  common_tags = {
    Env     = "testing"
    Project = "hello-world"
    Name    = "hello-world"
  }
  # https://cloud-images.ubuntu.com/locator/ec2/
  ubuntu_ami_id = "ami-05f9f61e6c95c7d1f"
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow SSH inbound and all outbound traffic"

  ingress {
    description      = "Allow inbound SSH from anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    description      = "Allow all outbound traffic"
    from_port        = 0
    to_port          = 0
    protocol         = -1
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = local.common_tags
}

resource "aws_instance" "hello_world" {
  ami             = local.ubuntu_ami_id
  instance_type   = "t2.nano"
  security_groups = [aws_security_group.allow_ssh.name]
  key_name        = aws_key_pair.hello_world.key_name
  tags            = local.common_tags
}

resource "aws_key_pair" "hello_world" {
  key_name   = "fionn_hello_world_local_key"
  public_key = file("~/.ssh/id_ed25519.pub")
  tags       = local.common_tags
}

output "hello_world_connection_data" {
  description = "IP address and DNS name of the server"
  value = {
    "public_ip"  = aws_instance.hello_world.public_ip
    "public_dns" = aws_instance.hello_world.public_dns
  }
}
