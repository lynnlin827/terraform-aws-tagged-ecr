# terraform-aws-tagged-ecr

Create ECR which:

* Keep only a number of images with the given tags
* Remove all untagged images

## Usage

```terraform
module "tagged-ecr" {
  source = "lynnlin827/tagged-ecr/aws"

  name             = "php-base-image"
  image_tag_prefix = ["DEV", "PR"]
  image_limit      = 50
}
```
