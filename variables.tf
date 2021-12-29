variable project {
    description = "Id of project used in GCP account"
    type = string
} 

variable location {
    description = "Location of the project where the infrastructure is deployed"
    type = string
    default = "europe-west2"
}

