
provider "aws" {
    access_key = "AKIAJ7X3UJE545CVRGVQ"
    secret_key = "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"
    region     = "us-west-2"
}

resource "aws_instance" "myfirst" {
    ami = "ami-bf4193c7"
    instance_type = "t2.micro"
}

output "aws_instance_public_dns" {
    value = "${aws_instance.myfirst.public_dns}"
}
