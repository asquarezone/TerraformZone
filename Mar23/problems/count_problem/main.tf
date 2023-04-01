resource "local_file" "foo" {
  for_each = toset(var.filenames)
  content  = "hello"
  filename = each.key
}