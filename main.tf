terraform {

  required_version = "1.2.3"

  required_providers {

    aws = {
      source  = "hashicorp/aws"
      version = "4.20.0"

    }
  }

}

# Configure the AWS Provider
provider "aws" {
  region                   = var.aws_region
  shared_credentials_files = ["~/.aws/credentials"]
  profile                  = "terraform_sandbox_gordon"

  default_tags {
    tags = {
      Repo = "https://github.com/gordonmurray/terraform_aws_apache_drill_zookeeper"
    }
  }
}
