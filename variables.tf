variable "PUBLIC_KEY_SSH" {
  type = string
}

variable "PRIVATE_KEY_PATH" {
  type = string
  default = "/.ssh/aws_key.pem"
  description = "Path where your aws key pem file is located."
}

variable "AWS_ACCESS_KEY" {
  type = string
  description = ""
}
variable "AWS_SECRET_KEY" {}