provider "aws" {
  region = "us-west-2"
  access_key = "AKIAJFQ6ZK65HMR7M36A"
  secret_key = "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"  
}



module "security-group" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "2.11.0"

  # insert the 2 required variables here
  name = "sgfortest"
  vpc_id = "vpc-4366ce24"
}