#-------------------------Terraform Variables---------------------
variable "environment" {
  description = "Environment name for deployment"
  type        = string
  default     = "dev"
}


variable "do_region" {
  description = "DigitalOcean region resources are deployed to"
  type        = string
  default     = "af-south-1"
}


variable "do_token" {
  description = "DigitalOcean API token"
  type        = string
  default     = "dop_v1_9e95a567711f988b232bef1b5c60a2540066a8edbdec25f739d091e82beb6cf6"
}

#-------------------------VPC Variables---------------------

variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr" {
  description = "Subnet cidr block"
  type        = string
  default     = "10.0.0.0/24"
}


