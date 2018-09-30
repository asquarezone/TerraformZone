provider "aws" {
    access_key = "AKIAIMJ6GMYHPIENQSIQ"
    secret_key = "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"
    region = "us-east-1"
}

module "ec2_cluster" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name           = "redhatvm"
  instance_count = 2

  ami                    = "ami-6871a115"
  instance_type          = "t2.micro"
  key_name               = "terraform"
  associate_public_ip_address = true
  vpc_security_group_ids = ["sg-41969a34"]
  subnet_id              = "subnet-22c0252d"

}

output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2_cluster.public_dns}"
}