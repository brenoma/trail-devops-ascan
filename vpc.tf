resource "aws_vpc" "new-vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "${var.prefix}-vpc"
  }
}

data "aws_availability_zones" "availability" {
  
}

output "AZ" {
  value = "${data.aws_availability_zones.availability.names}"
}

resource "aws_subnet" "subnets" {
  count = 2
  availability_zone = data.aws_availability_zones.availability.names[count.index]
  vpc_id = aws_vpc.new-vpc.id
  cidr_block = "10.0.${count.index}.0/24"
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.prefix}-subnet-${count.index}"
  }
}