resource "aws_ecr_repository" "ecr" {
  name = "${var.name}"
}

resource "aws_ecr_lifecycle_policy" "lifecycle_policy" {
  repository = "${aws_ecr_repository.ecr.name}"
  policy     = "${length(var.image_tag_prefix) == 0 ? "${file("${path.module}/files/rules_tagged.json")}" : "${data.template_file.rules_tagged_latest.rendered}"}"
}

data "template_file" "rule_tagged_latest" {
  template = "${file("${path.module}/files/rule_tagged_latest.tpl")}"
  count    = "${length(var.image_tag_prefix)}"

  vars {
    priority         = "${count.index + 2}"
    image_limit      = "${var.image_limit}"
    image_tag_prefix = "${element(var.image_tag_prefix, count.index)}"
  }
}

data "template_file" "rules_tagged_latest" {
  template = "${file("${path.module}/files/rules_tagged_latest.tpl")}"

  vars {
    rules = "${join(",", data.template_file.rule_tagged_latest.*.rendered)}"
  }
}
