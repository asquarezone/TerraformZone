resource "aws_security_group" "sg" {
  name        = var.securitygroup_config.name
  description = var.securitygroup_config.description
  vpc_id      = var.securitygroup_config.vpc_id

}

resource "aws_security_group_rule" "websg_rules" {
  count             = length(var.securitygroup_config.rules)
  security_group_id = aws_security_group.sg.id
  type              = var.securitygroup_config.rules[count.index].type
  from_port         = var.securitygroup_config.rules[count.index].from_port
  to_port           = var.securitygroup_config.rules[count.index].to_port
  protocol          = var.securitygroup_config.rules[count.index].protocol
  cidr_blocks       = [var.securitygroup_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.sg
  ]
}