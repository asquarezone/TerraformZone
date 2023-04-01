resource "aws_instance" "apache" {
  ami                         = "ami-0fcf52bcf5db7b003" #todo:  replace this with data source
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  key_name                    = "my_id_rsa" #todo:  replace this with data source
  subnet_id                   = data.aws_subnet.first.id
  user_data                   = file("apache.sh")
  vpc_security_group_ids      = ["sg-05adaf452b268c335"]

}