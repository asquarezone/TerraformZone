resource "aws_security_group" "websg" {
  name        = var.web_sg_config.name
  description = var.web_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_security_group_rule" "websg_rules" {
  count             = length(var.web_sg_config.rules)
  security_group_id = aws_security_group.websg.id
  type              = var.web_sg_config.rules[count.index].type
  from_port         = var.web_sg_config.rules[count.index].from_port
  to_port           = var.web_sg_config.rules[count.index].to_port
  protocol          = var.web_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.web_sg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.websg
  ]
}


resource "aws_security_group" "dbsg" {
  name        = var.db_sg_config.name
  description = var.db_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_security_group_rule" "dbsg_rules" {
  count             = length(var.db_sg_config.rules)
  security_group_id = aws_security_group.dbsg.id
  type              = var.db_sg_config.rules[count.index].type
  from_port         = var.db_sg_config.rules[count.index].from_port
  to_port           = var.db_sg_config.rules[count.index].to_port
  protocol          = var.db_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.db_sg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.dbsg
  ]
}


resource "aws_security_group" "appsg" {
  name        = var.app_sg_config.name
  description = var.app_sg_config.description
  vpc_id      = aws_vpc.ntier_vpc.id

  depends_on = [
    aws_vpc.ntier_vpc
  ]

}

resource "aws_security_group_rule" "appsg_rules" {
  count             = length(var.app_sg_config.rules)
  security_group_id = aws_security_group.appsg.id
  type              = var.app_sg_config.rules[count.index].type
  from_port         = var.app_sg_config.rules[count.index].from_port
  to_port           = var.app_sg_config.rules[count.index].to_port
  protocol          = var.app_sg_config.rules[count.index].protocol
  cidr_blocks       = [var.app_sg_config.rules[count.index].cidr_block]
  depends_on = [
    aws_security_group.appsg
  ]
}
