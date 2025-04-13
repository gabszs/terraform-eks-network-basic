resource "aws_ecr_repository" "this" {
  count = length(var.ecr_repositories)

  name                 = var.ecr_repositories[count.index].name
  image_tag_mutability = var.ecr_repositories[count.index].image_tag_mutability

  image_scanning_configuration {
    scan_on_push = var.ecr_repositories[count.index].scan_on_push
  }
}