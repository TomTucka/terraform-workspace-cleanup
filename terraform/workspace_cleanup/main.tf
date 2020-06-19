resource "aws_dynamodb_table" "workspace_cleanup_table" {
  count        = local.enabled
  name         = "WorkspaceCleanup"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "WorkspaceName"

  attribute {
    name = "WorkspaceName"
    type = "S"
  }

  ttl {
    attribute_name = "ExpiresTTL"
    enabled        = true
  }

  lifecycle {
    prevent_destroy = false
  }
}
