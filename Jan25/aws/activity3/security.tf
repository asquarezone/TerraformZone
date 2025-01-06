resource "aws_security_group" "base" {
  vpc_id      = aws_vpc.base.id
  name        = var.web_security_group.name
  description = var.web_security_group.description
  tags = {
    Name = var.web_security_group.name
  }
  depends_on = [aws_vpc.base]

}
resource "aws_vpc_security_group_ingress_rule" "base" {
  count             = length(var.web_security_group.rules)
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = var.web_security_group.rules[count.index].cidr_ipv4
  from_port         = var.web_security_group.rules[count.index].from_port
  to_port           = var.web_security_group.rules[count.index].to_port
  ip_protocol       = var.web_security_group.rules[count.index].ip_protocol

}

resource "aws_vpc_security_group_egress_rule" "default" {
  security_group_id = aws_security_group.base.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1
}


resource "aws_security_group" "db" {
  vpc_id      = aws_vpc.base.id
  name        = var.db_security_group.name
  description = var.db_security_group.description
  tags = {
    Name = var.db_security_group.name
  }
  depends_on = [aws_vpc.base]

}
resource "aws_vpc_security_group_ingress_rule" "db" {
  count             = length(var.db_security_group.rules)
  security_group_id = aws_security_group.db.id
  cidr_ipv4         = var.db_security_group.rules[count.index].cidr_ipv4
  from_port         = var.db_security_group.rules[count.index].from_port
  to_port           = var.db_security_group.rules[count.index].to_port
  ip_protocol       = var.db_security_group.rules[count.index].ip_protocol

}

resource "aws_vpc_security_group_egress_rule" "dbdefault" {
  security_group_id = aws_security_group.db.id
  cidr_ipv4         = local.anywhere
  ip_protocol       = -1
}

resource "aws_key_pair" "base" {
  key_name   = var.key_file_info.name
  public_key = file(var.key_file_info.public_key_path)
}