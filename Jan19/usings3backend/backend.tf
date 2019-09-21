terraform {
    backend "s3"{
        bucket = "qtterraformstatestorage"
        key = "backenddemo"
        region = "us-west-2"
    }
}

# since all the fields are not defined over here we will be passing this form
# CLI in terraform init command


