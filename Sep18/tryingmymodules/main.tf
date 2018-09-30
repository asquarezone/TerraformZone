provider "aws" {
    access_key = "AKIAIMJ6GMYHPIENQSIQ"
    secret_key = "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"
    region = "us-east-1"
}

module "mysg" {
  source = "./modules/mysecuritygroup"

  name = "openforall"
}


output "sgid" {
  value = "${module.mysg.securitygroupid}"
}

