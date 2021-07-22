module "network" {
  source = "../modules/aws/network"

  project_config = {
    name        = var.project.name
    service     = var.project.service
    environment = var.project.environment
  }

  vpc_config = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_support   = true
    enable_dns_hostnames = true
  }

  subnet_config = {
    public = {
      map_public_ip_on_launch = true
      subnets = {
        ap-northeast-1a = "10.0.10.0/24"
        ap-northeast-1c = "10.0.11.0/24"
        ap-northeast-1d = "10.0.12.0/24"
      }
    }
    private = {
      map_public_ip_on_launch = false
      subnets = {
        ap-northeast-1a = "10.0.20.0/24"
        ap-northeast-1c = "10.0.21.0/24"
        ap-northeast-1d = "10.0.22.0/24"
      }
    }
  }
}
