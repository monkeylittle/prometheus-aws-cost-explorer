data "aws_region" "current" {}

terraform {
  backend "s3" {
    bucket = "prometheus-aws-cost-explorer-test-terraform-state"
    key    = "prometheus_aws_cost_explorer/demo.tfstate"
    region = "eu-west-1"

    dynamodb_table = "prometheus-aws-cost-explorer-test-terraform-state-lock"
    encrypt        = true
  }
}
