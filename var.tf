
variable "vpc_id" {
    type = string
    default = "vpc-0fa6757f956ba1c07"
}


variable "public_subnets_list" {
  type        = map
  description = "Public Subnets"
  default = {
    "ap-south-1a" = "10.0.3.0/24"
  }
}


variable "private_subnets_list" {
  type        = map
  description = "Private Subnets"
  default = {
    "ap-south-1b" = "10.0.1.0/24"

    "ap-south-1c" = "10.0.2.0/24"
  }
}
 

 variable "allocated_storage"{
    description= " rds allocated storage " 
    type= number 
    }
variable "db_name"{
    description= " rds db name " 
    type= string 
    }
variable "engine"{
    description= " rds engine" 
    type= string 
    }
variable "engine_version"{
    description= " rds engine version " 
    type= string
    }
variable "instance_class"{
    description= " rds instance " 
    type= string 
    }
variable "username"{
    description= " rds username " 
    type= string 
    }
variable "password"{
    description= " rds passwd " 
    type= string 
    }