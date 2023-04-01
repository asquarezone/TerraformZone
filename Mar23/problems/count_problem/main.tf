resource "local_file" "foo" {
  for_each = var.fileinfo
  content  = each.value.content
  filename = each.value.name
}