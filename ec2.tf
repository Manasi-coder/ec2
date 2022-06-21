resource "aws_security_group" "sg"{
  
  vpc_id      = aws_vpc.dev.id
  
//To Allow SSH Transport
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  // To Allow Port 80 Transport
  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  tags = {
    Name = ""
  }
  
}

# Creating EC2 instances in private subnets
resource "aws_instance" "private_inst_1" {
  ami           = "ami-0c1a7f89451184c8b"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.dev-private-1.id}"
  vpc_security_group_ids = [aws_security_group.sg.id,]
  tags = {
    Name = "private_inst_1"
  }
}