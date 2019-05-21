
resource "null_resource" "test" {
    provisioner "file" {
        source = "1.txt"
        destination = "2.txt"
    }
}
