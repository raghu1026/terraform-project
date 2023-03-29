#this file consists of code for instances and sg
provider "aws" {
  region     = "us-east-1"
  access_key = "AKIAXMY6O2REYJXNBYQW"
  secret_key = "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"
}

resource "aws_instance" "one" {
  ami                    = "ami-04581fbf744a7d11f"
  instance_type          = "t2.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone      = "us-east-1a"
  user_data              = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my app created by terraform infrastructurte by raham sir server-1" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-11"
  }
}

resource "aws_instance" "two" {
  ami                    = "ami-04581fbf744a7d11f"
  instance_type          = "t2.micro"
  key_name               = "jenkins"
  vpc_security_group_ids = [aws_security_group.three.id]
  availability_zone      = "us-east-1b"
  user_data              = <<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo "hai all this is my website created by terraform infrastructurte by raham sir server-2" > /var/www/html/index.html
EOF
  tags = {
    Name = "server-12"
  }
}

resource "aws_security_group" "three" {
  name = "eeeaelb-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_s3_bucket" "four" {
  bucket = "raaasaghu2bucketterra"
}

resource "aws_iam_user" "five" {
  name = "rahamaussse3r11"
}

resource "aws_ebs_volume" "six" {
  availability_zone = "us-east-1b"
  size              = 40
  tags = {
    Name = "ebas-0011"
  }
}
