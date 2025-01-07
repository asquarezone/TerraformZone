data "aws_ami" "webimage" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.web_server_info.ami_filter.name]
  }


  owners = [var.web_server_info.ami_filter.owner] # Canonical
}
