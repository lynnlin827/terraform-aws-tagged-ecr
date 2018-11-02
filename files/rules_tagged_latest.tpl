{
  "rules": [
    {
      "rulePriority": 1,
      "description": "Remove all untagged images",
      "selection": {
        "tagStatus": "untagged",
        "countType": "sinceImagePushed",
        "countUnit": "days",
        "countNumber": 1
      },
      "action": {
        "type": "expire"
      }
    },
    ${rules}
  ]
}
