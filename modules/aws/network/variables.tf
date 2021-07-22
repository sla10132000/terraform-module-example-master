variable "project_config" {
  type = object({
    name        = string
    service     = string
    environment = string
  })
}

variable "vpc_config" {
  type = object({
    cidr_block           = string
    enable_dns_support   = bool
    enable_dns_hostnames = bool
  })
}

variable "subnet_config" {
  type = object({
    public = object({
      map_public_ip_on_launch = bool
      subnets                 = map(string)
    })
    private = object({
      map_public_ip_on_launch = bool
      subnets                 = map(string)
    })
  })
}