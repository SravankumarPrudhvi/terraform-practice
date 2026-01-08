variable "vpc_cidr" {
  description = "vpc cidr block range"
  type = string
}

variable "public_subnets" {
    description = "public subnet id details"
    type = list(string)
  
}

variable "private_subnets" {
  description = "private subnet id details"
  type = list(string)
}

variable "env" {
    description = "environment"
    type = string
  
}

variable "availability_zones" {
  description = "availability zone"
  type = list(string)
}
variable "tags" {
    type = map(string)
    default = {
      "name" = "custom-vpc-id"
    }
  
}