module "http_sg" {
  source = "terraform-aws-modules/security-group/aws"

  name        = var.web_sg_info.name
  description = var.web_sg_info.description
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = var.web_sg_info.ingress_cidr_blocks
  ingress_rules       = var.web_sg_info.ingress_rules
  egress_cidr_blocks  = var.web_sg_info.egress_cidr_blocks
  egress_rules        = var.web_sg_info.egress_rules

}