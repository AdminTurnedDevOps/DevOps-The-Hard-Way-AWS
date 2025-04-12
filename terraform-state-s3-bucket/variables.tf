variable "state_bucket" {
  description = "The name of the S3 bucket to store the Terraform state file"
  type        = string
  default     = "terraform-state-devopsthehardway"
}