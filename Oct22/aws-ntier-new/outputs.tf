# output "keypair" {
#     value = data.aws_key_pair.all.id
# }

output "url" {
    value = format("http://%s", aws_instance.webec2.public_ip)
}