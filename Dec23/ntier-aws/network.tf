resource "aws_vpc" "primary_network" {
  cidr_block = "10.100.0.0/16"

  tags = {
    Name      = "ntier"
    Env       = "Dev"
    CreatedBy = "Teraform"
  }

}