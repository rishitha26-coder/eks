terraform {
  backend "s3" {
    bucket         = "amgine-terraform-iac-state"
    key            = "terraform/dev/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
    dynamodb_table = "terraform_tf_lockid"
  }
}
