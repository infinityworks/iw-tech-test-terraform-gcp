variable project {
    description = "Id of project used in GCP account"
    type = string
} 

variable location {
    description = "Location of the project where the infrastructure is deployed"
    type = string
    default = "europe-west2"
}

variable primary-ip-cidr {
    description = "primary ip cidr range for subnet"
    type = string 
    default = "10.2.0.0/16"
}

variable "primary-az" {
    description = "primary az for deployment"
    type = string
    default = "europe-west2-a"
  
}