variable "PREFIX" {
  type = string
  description = "Prefix for resource names"
  default = "ascan"
}

variable "NUMBER_OF_SUBNETS" {
  type = number
  description = "Number of how many subnets will be created"
  default = 1
}