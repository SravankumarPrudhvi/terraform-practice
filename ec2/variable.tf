variable "ami_id" {
    description = "ami id details"
    type = string
  }

  variable "instance_type" {
    description = "instance type values"
    type = string
    
    }

    variable "subnet_id" {
      description = "subnet id values"
      type = string
    }

    variable "env" {
        description = "environmental variables"
        type = string
      
    }

    variable "tags" {
      type = map(string)
      default = {
        
      }
    }