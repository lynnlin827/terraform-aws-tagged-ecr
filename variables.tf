variable "name" {}

variable "image_limit" {
  default = 100
}

variable "image_tag_prefix" {
  type    = "list"
  default = []
}
