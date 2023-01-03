variable "prefix" {}
variable "cluster_name" {}
variable "retention_days" {}
variable "PUBLIC_KEY_SSH" {}
variable "PRIVATE_KEY_PATH" {
  default = "/.ssh/aws_key.pem"
}
variable "EC2_USER" {
  default = "ubuntu"
}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}