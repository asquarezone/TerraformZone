
provider "aws" {
  access_key = "${var.myaccesskey}"
  secret_key = "${var.mysecretkey}"
  region = "${var.myregion}"
}
