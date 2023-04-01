variable "filenames" {
  type    = list(string)
  default = ["test1.txt", "test2.txt", "test3.txt"]

}


variable "fileinfo" {
  type = map(object({
    name    = string
    content = string
  }))
  default = {
    "first" = {
      content = "first"
      name    = "1.txt"
    },
    "second" = {
      content = "second"
      name    = "2.txt"
    }
  }

}