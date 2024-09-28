terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.69.0"
    }
  }
  cloud { 
    
    organization = "Learningthoughts" 

    workspaces { 
      name = "sample" 
    } 
  } 
}

provider "aws" {
  # Configuration options
  region = "ap-south-1"
}