/*** VPC1 ***/

resource "aws_vpc" "vpc1" {
  cidr_block           = "${var.VPC1["cidr_block"]}"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags {
    Name = "${var.VPC1["tag"]}"
  }
}

/*** END VPC1 ***/

/*** INTERNET GATEWAY ***/

resource "aws_internet_gateway" "vpc1-igw" {
  vpc_id = "${aws_vpc.vpc1.id}"

  tags {
    name = "vpc1-igw"
  }
}
/*** END INTERNET GATEWAY ***/

/*** PUBLIC ROUTE TABLE ***/

resource "aws_route_table" "vpc1-public-route-table1" {
  vpc_id = "${aws_vpc.vpc1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.vpc1-igw.id}"
  }

  tags {
    Name = "VPC1-PUBLIC-ROUTE-TABLE"
  }
}

resource "aws_route_table_association" "vpc1-public-route-table1a" {
  subnet_id      = "${aws_subnet.vpc1-public-subnet-1a.id}"
  route_table_id = "${aws_route_table.vpc1-public-route-table1.id}"
}
resource "aws_route_table_association" "vpc1-public-route-table1b" {
  subnet_id      = "${aws_subnet.vpc1-public-subnet-1b.id}"
  route_table_id = "${aws_route_table.vpc1-public-route-table1.id}"
}

/*** END PUBLIC ROUTE TABLE ***/

/*** PRIVATE ROUTE TABLE ***/

resource "aws_route_table" "vpc1-private-route-table1" {
  vpc_id = "${aws_vpc.vpc1.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.vpc1-natgw.id}"
  }

  tags {
    Name = "VPC1-PRIVATE-ROUTE-TABLE"
  }
}

resource "aws_route_table_association" "vpc1-private-route-table1a" {
  subnet_id      = "${aws_subnet.vpc1-private-subnet-1a.id}"
  route_table_id = "${aws_route_table.vpc1-private-route-table1.id}"
}

resource "aws_route_table_association" "vpc1-private-route-table1b" {
  subnet_id      = "${aws_subnet.vpc1-private-subnet-1b.id}"
  route_table_id = "${aws_route_table.vpc1-private-route-table1.id}"
}

/*** END PRIVATE ROUTE TABLE ***/

/*** PUBLIC SUBNETS ***/

resource "aws_subnet" "vpc1-public-subnet-1a" {
  vpc_id            = "${aws_vpc.vpc1.id}"
  cidr_block        = "${var.VPC1-PUBLIC-SUBNET-1A["cidr_block"]}"
  availability_zone = "${var.VPC1-PUBLIC-SUBNET-1A["az"]}"
  map_public_ip_on_launch = true
  tags {
    Name = "${var.VPC1-PUBLIC-SUBNET-1A["tag"]}"
  }
}

resource "aws_subnet" "vpc1-public-subnet-1b" {
  vpc_id            = "${aws_vpc.vpc1.id}"
  cidr_block        = "${var.VPC1-PUBLIC-SUBNET-1B["cidr_block"]}"
  availability_zone = "${var.VPC1-PUBLIC-SUBNET-1B["az"]}"
  map_public_ip_on_launch = true
  tags {
    Name = "${var.VPC1-PUBLIC-SUBNET-1B["tag"]}"
  }
}

/*** END PUBLIC SUBNETS ***/

/*** PRIVATE SUBNETS ***/

resource "aws_subnet" "vpc1-private-subnet-1a" {
  vpc_id            = "${aws_vpc.vpc1.id}"
  cidr_block        = "${var.VPC1-PRIVATE-SUBNET-1A["cidr_block"]}"
  availability_zone = "${var.VPC1-PRIVATE-SUBNET-1A["az"]}"
  map_public_ip_on_launch = false
  tags {
    Name = "${var.VPC1-PRIVATE-SUBNET-1A["tag"]}"
  }  
}

resource "aws_subnet" "vpc1-private-subnet-1b" {
  vpc_id            = "${aws_vpc.vpc1.id}"
  cidr_block        = "${var.VPC1-PRIVATE-SUBNET-1B["cidr_block"]}"
  availability_zone = "${var.VPC1-PRIVATE-SUBNET-1B["az"]}"
  map_public_ip_on_launch = false
  tags {
    Name = "${var.VPC1-PRIVATE-SUBNET-1B["tag"]}"
  }  
}

/*** END PRIVATE SUBNETS ***/

