terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.31.0"
    }
  }
  // required_version = "> 1.6.0"
}

provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Env       = "Dev"
      CreatedBy = "Teraform"
    }

  }
}