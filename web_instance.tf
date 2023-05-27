resource "aws_security_group" "web_sg" {
  name        = "web_sg"
  
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "allow http"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]

  }
  ingress {
    description      = "allow https"
    from_port        = 443
    to_port          = 443
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
resource "aws_instance" "my-ec2"{
    ami="ami-09ba48996007c8b50"
    instance_type="t2.micro"
    for_each      = aws_subnet.public_subnet 
    subnet_id      = each.value.id
    vpc_security_group_ids = [aws_security_group.web_sg.id]
    tags = {
        name = "web_ec2 "
    }b
}

