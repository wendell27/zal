/*** ELB SECURITY GROUP ***/

resource "aws_security_group" "elb-securitygroup" {
  name = "elb"
  description = "security group for load balancer"
  egress {
      from_port = 0
      to_port = 0
      protocol = "-1"
      cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  } 
  vpc_id = "${aws_vpc.vpc1.id}"

  tags {
    Name = "elb"
  }
}

/*** END ELB SECURITY GROUP ***/

/*** SECURITY GROUP ALLOW LOCAL ***/

resource "aws_security_group" "allow-local" {
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.ALLOWED_IPS["local"]}"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${var.ALLOWED_IPS["local"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  vpc_id = "${aws_vpc.vpc1.id}"

  tags {
    Name = "allow-local"
  }
}

/*** END SECURITY GROUP ALLOW LOCAL ***/

/*** SECURITY GROUP ALLOW SSH ***/

resource "aws_security_group" "allow-ssh" {
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  vpc_id = "${aws_vpc.vpc1.id}"

  tags {
    Name = "allow-ssh"
  }
}

/*** END SECURITY GROUP ALLOW SSH ***/

/*** SECURITY GROUP ALLOW WEB ***/

resource "aws_security_group" "allow-web" {
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${var.ALLOWED_IPS["all"]}"]
  }

  vpc_id = "${aws_vpc.vpc1.id}"

  tags {
    Name = "allow-web"
  }
}

/*** END SECURITY GROUP ALLOW WEB ***/

