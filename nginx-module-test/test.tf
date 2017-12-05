module "nginx-module" {
    source = "..\\nginx-module"
    aws_access_key = "AKIAJH62RZC42X3AXQVQ"
    aws_secret_key = "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"
    private_key_path ="buildserver.pem"

}