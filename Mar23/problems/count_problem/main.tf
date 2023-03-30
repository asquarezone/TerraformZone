resource "local_file" "foo" {
  count    = length(var.filenames)
  content  = "hello"
  filename = var.filenames[count.index]
}