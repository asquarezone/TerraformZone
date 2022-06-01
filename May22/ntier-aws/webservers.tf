resource "aws_instance" "webservers" {
    count                           = var.webserver_info.count
    ami                             = var.webserver_info.ami_id
    associate_public_ip_address     = var.webserver_info.public_ip_enabled
    instance_type                   = var.webserver_info.instance_type
    tags                            = {
        Name                        = format("%s-%d",var.webserver_info.name, count.index+1)
    }
    key_name                        = aws_key_pair.keypair.key_name  
    subnet_id                       = data.aws_subnets.web_subnets.ids[count.index]
    vpc_security_group_ids          = [aws_security_group.websg.id]  
    depends_on = [
      aws_instance.appservers
    ]
}