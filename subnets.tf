

data "aws_vpc" "selected" {
  id = var.vpc_id
}

resource "aws_subnet" "public_subnet" {

  for_each          = tomap(var.public_subnets_list)
  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = data.aws_vpc.selected.id
}
resource "aws_subnet" "private_subnet" {

  for_each          = tomap(var.private_subnets_list)
  availability_zone = each.key
  cidr_block        = each.value
  vpc_id            = data.aws_vpc.selected.id
}

    resource "aws_route_table" "public_rt" {
  vpc_id =  data.aws_vpc.selected.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "igw-0bd0b5067d90d1fe3"
  }
    }
resource "aws_route_table_association" "public_1_rt_a" {
    for_each      = aws_subnet.public_subnet 
   subnet_id      = each.value.id
  route_table_id = aws_route_table.public_rt.id
}
