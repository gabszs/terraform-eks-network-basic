variable "project" {
  type    = string
  default = "aws-live-estudo-redes-tf"
}

variable "default_tags" {
  type = object({
    Environment = string
    Project     = string
    Owner       = string
    ManagedBy   = string
  })

  default = {
    Environment = "dev"
    Project     = "xtracky-system"
    Owner       = "gabszs"
    ManagedBy   = "terraform"
  }
}

variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    public_route_table_name  = string
    nat_gateway_name         = string
    private_route_table_name = string
    public_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
    private_subnets = list(object({
      name                    = string
      cidr_block              = string
      availability_zone       = string
      map_public_ip_on_launch = bool
    }))
  })

  default = {
    name                     = "aws-live-estudo-redes-tf-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "internet-gateway"
    public_route_table_name  = "public-route-table"
    nat_gateway_name         = "nat-gateway"
    private_route_table_name = "private-route-table"
    public_subnets = [{
      name                    = "aws-live-estudo-redes-tf-sa-east-public-subnet-1a"
      cidr_block              = "10.0.0.0/26"
      availability_zone       = "sa-east-1a"
      map_public_ip_on_launch = true
      },
      {
        name                    = "aws-live-estudo-redes-tf-sa-east-public-subnet-1b"
        cidr_block              = "10.0.0.64/26"
        availability_zone       = "sa-east-1b"
        map_public_ip_on_launch = true
      }
    ]
    private_subnets = [{
      name                    = "aws-live-estudo-redes-tf-sa-east-private-subnet-1c"
      cidr_block              = "10.0.0.128/26"
      availability_zone       = "sa-east-1a"
      map_public_ip_on_launch = false
      },
      {
        name                    = "aws-live-estudo-redes-tf-sa-east-private-subnet-1d"
        cidr_block              = "10.0.0.192/26"
        availability_zone       = "sa-east-1b"
        map_public_ip_on_launch = false
      }
    ]
  }
}