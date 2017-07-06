/*** NAT GATEWAY ***/
resource "aws_eip" "nat-eip" {
   vpc = true
}

resource "aws_nat_gateway" "vpc1-natgw" {
  allocation_id = "${aws_eip.nat-eip.id}"
  subnet_id     = "${aws_subnet.vpc1-public-subnet-1a.id}"
  depends_on    = ["aws_internet_gateway.vpc1-igw"]
}

/*** END NAT GATEWAY ***/