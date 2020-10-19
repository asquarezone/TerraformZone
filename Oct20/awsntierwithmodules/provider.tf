provider "aws" {
    region      = "ap-south-1"
}

provider "aws" {
    region      = "us-west-2"
    alias       = "west"
}

