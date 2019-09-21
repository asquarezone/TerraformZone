    terraform {
      backend "s3" {
        bucket         = "qtterraformstatestorage"
        acl            = "bucket-owner-full-control"
        key            = "backenddemo"
        region         = "us-west-2"
        encrypt        = false
        dynamodb_table = "qtterraformstatelock"
      }
    }
    