variable "PUBLIC_KEY_SSH" {
  type = string
  description = "Public key for SSH Connection."
}

variable "INSTANCE_AMI" {
  type = string
  description = "Ubuntu 22.04"
  default = "ami-0574da719dca65348"
}

variable "INSTANCE_TYPE" {
  type = string
  description = "Instance type"
  default = "t2.micro"
}

variable "INSTANCE_USER" {
  type = string
  description = "Name of the user of the system."
  default = "ubuntu"
}

variable "SUBNET_ID" {
  type = string
  description = "ID of the Subnet that application will be deployed."
}

variable "SG_ID" {
  type = string
  description = "ID of the Security Group that application will be deployed."
}