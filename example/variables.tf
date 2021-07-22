variable "access_key" {
  description = "AWS Access Key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "role_arn" {
  description = "AWS Role ARN for Assume Role"
}

variable "region" {
  description = "AWS Region"
  default     = "ap-northeast-1"
}

variable "project" {
  description = "Project Setting"
  default = {
    name        = "terraform"
    service     = "example"
    environment = "dev"
  }
}
