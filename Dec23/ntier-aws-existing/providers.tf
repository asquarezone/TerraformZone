terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 5.31.0"
    }
  }
  // required_version = "> 1.6.0"
  backend "s3" {
    bucket = "qtdectfstate"
    key = "examples/ntier-aws-existing"
    region = "us-west-2"
    dynamodb_table = "qtterraformstate"
    
  }
}

provider "aws" {
  region = "us-west-2"
  default_tags {
    tags = {
      Env       = "Dev"
      CreatedBy = "Teraform"
    }

  }
}

