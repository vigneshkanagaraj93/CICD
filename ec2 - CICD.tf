#create resource

resource "aws_instance" "myec2" {
  ami = "ami-0b0dcb5067f052a63"
  instance_type = "t2.micro"
  key_name ="terraformtest"
  security_groups = [aws_security_group.myec2.id]
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
