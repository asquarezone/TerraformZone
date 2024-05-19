# # lets pull information about resource groups
# data "azurerm_resource_group" "query" {
#     name = "ssh"
# }

# # lets pull ubuntu 22.04 image

# data "azurerm_platform_image" "ubuntu" {
#     location = "eastus"
#     publisher = "canonical"
#     offer = "0001-com-ubuntu-server-jammy"
#     sku = "22_04-lts-gen2"
# }


# data "aws_key_pair" "valid" {
#     key_name = "my_idrsa"
  
# }

# lets pull the latest ubuntu 22.04 image
data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

output "ami_id" {
    value = data.aws_ami.ubuntu.id
}


