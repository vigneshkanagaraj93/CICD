#create resource

resource "aws_instance" "myec2" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  count = "1"
  subnet_id = aws_subnet.myec2.id
  key_name ="terraformtest"
  security_groups = [aws_security_group.myec2.id]
  }

#create VPC

 resource "aws_vpc" "myec2vpc" {
  cidr_block = "10.10.0.0/16"
  }
 
#create subnet

 resource "aws_subnet" "publicsubnet" {
  vpc_id     = aws_vpc.myec2vpc.id
  cidr_block = "10.10.1.0/24"
}

resource "aws_subnet" "privatesubnet" {
  vpc_id     = aws_vpc.myec2vpc.id
  cidr_block = "10.10.2.0/24"
}

#create security group

resource "aws_security_group" "myec2" {
  name        = "myec2"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.myec2vpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
}

#create volume

resource "aws_ebs_volume" "myec2" {
  availability_zone = "us-east-1"
  size              = 10

}

#create s3_bucket

resource "aws_s3_bucket" "myec2" {
  bucket = "myec2bucket"

  versioning {
    enabled = true
  }
}
