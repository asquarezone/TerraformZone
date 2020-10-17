locals {
  dbsubnets = ["db", "db2"]
  public_subnets    = lookup(var.associations, "public")
  private_subnets   = lookup(var.associations, "private")
}
