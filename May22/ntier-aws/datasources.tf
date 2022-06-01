data "aws_subnets" "db_subnets" {
    filter {
      name      = "tag:Name"
      values    = var.db_subnets 
    }
    filter {
      name      = "vpc-id"
      values    = [aws_vpc.ntier.id]
    }

    depends_on = [
      aws_subnet.subnets
    ]
  
}

data "aws_subnets" "app_subnets" {
    filter {
      name      = "tag:Name"
      values    = var.appserver_info.subnets
    }
    filter {
      name      = "vpc-id"
      values    = [aws_vpc.ntier.id]
    }

    depends_on = [
      aws_key_pair.keypair
    ]
  
}

data "aws_subnets" "web_subnets" {
    filter {
      name      = "tag:Name"
      values    = var.webserver_info.subnets
    }
    filter {
      name      = "vpc-id"
      values    = [aws_vpc.ntier.id]
    }

    depends_on = [
      aws_key_pair.keypair
    ]
  
}