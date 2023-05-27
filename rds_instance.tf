resource "aws_security_group" "rds_sg" {
  name        = "rds_sg"
  
  vpc_id      = data.aws_vpc.selected.id

  ingress {
    description      = "allow my sql traffic from web_sg"
    from_port        = 3306
    to_port          = 3306
    protocol         = "tcp"
    security_groups  = [aws_security_group.web_sg.id]
     }
  }
resource "aws_db_subnet_group" "default" {
  name       = "monica_sg"
 # for_each      = aws_subnet.private_subnet 
  #subnet_ids =  each.value.id 
  subnet_ids  = [for subnet in aws_subnet.private_subnet : subnet.id] 
  
      }

resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name 
  engine               = var.engine
  engine_version       = var.engine_version 
  instance_class       = var.instance_class  
  username             = var.username
  password             = var.password
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.default.id 
}
