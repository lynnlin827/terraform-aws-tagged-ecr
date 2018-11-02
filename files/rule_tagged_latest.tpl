{
    "rulePriority": ${priority},
    "description": "Keep only latest ${image_limit} images tagged ${image_tag_prefix}",
    "selection": {
    "tagStatus": "tagged",
    "tagPrefixList": ["${image_tag_prefix}"],
    "countType": "imageCountMoreThan",
    "countNumber": ${image_limit}
    },
    "action": {
    "type": "expire"
    }
}
