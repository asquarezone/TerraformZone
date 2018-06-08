    terraform {
      backend "s3" {
        bucket         = "qt-terraform-2"
        key            = "multicloud.state"
        region         = "us-west-2"
        encrypt        = false
        dynamodb_table = "multicloud-qt"
      }
    }
    