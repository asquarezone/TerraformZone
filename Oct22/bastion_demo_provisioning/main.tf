resource "null_resource" "publicipprovisioner" {
    triggers = {
        running_number = var.public_provisoner_trigger
    }

    connection {
        type = "ssh"
        host = var.public_machine_ip
        user = var.username
        private_key = file(var.ssh_key_path)
      
    }

    provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
    ]
  }
  
}


resource "null_resource" "privatepprovisioner" {
    triggers = {
        running_number = var.private_provisoner_trigger
    }

    connection {
        type = "ssh"
        host = var.private_machine_ip
        user = var.username
        private_key = file(var.ssh_key_path)
        bastion_host = var.public_machine_ip
        bastion_private_key = file(var.ssh_key_path)
        bastion_user = var.username
      
    }
    
    provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt install apache2 -y",
    ]
  }
  
}