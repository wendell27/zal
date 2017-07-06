/*** VARS AWS API ***/

variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {
  default = "ap-southeast-1"
}

/*** VARS VPC1 ***/

variable "VPC1" {
  type = "map"

  default = {
    "tag"        = "VPC1"
    "cidr_block" = "172.19.0.0/16"
  }
}

/*** VARS VPC1 PUBLIC SUBNET AZ 1A ***/

variable "VPC1-PUBLIC-SUBNET-1A" {
  type = "map"

  default = {
    "tag"        = "VPC1 PUBLIC SUBNET 1A"
    "cidr_block" = "172.19.0.0/24"
    "az"         = "ap-southeast-1a"
  }
}

/*** VARS VPC1 PUBLIC SUBNET AZ 1B ***/

variable "VPC1-PUBLIC-SUBNET-1B" {
  type = "map"

  default = {
    "tag"         = "VPC1 PUBLIC SUBNET 1B"
    "cidr_block"  = "172.19.1.0/24"
    "az"          = "ap-southeast-1b"      
  }   

}

/*** VARS VPC1 PRIVATE SUBNET 1A ***/

variable "VPC1-PRIVATE-SUBNET-1A" {
  type = "map"

  default = {
    "tag"        = "VPC1 PRIVATE SUBNET 1A"
    "cidr_block" = "172.19.2.0/24"
    "az"         = "ap-southeast-1a"
  }
}

/*** VARS VPC1 PRIVATE SUBNET 1B ***/

variable "VPC1-PRIVATE-SUBNET-1B" {
  type = "map"

  default = {
    "tag"        = "VPC1 PRIVATE SUBNET 1B"
    "cidr_block" = "172.19.3.0/24"
    "az"         = "ap-southeast-1b"
  }
}

/*** VARS AMI ***/

variable "AMI_AMAZON_LINUX" {
  type = "map"

  default = {
    "us-east-1"       = "ami-a4c7edb2"
    "ap-southeast-1"  = "ami-77af2014"
  }
}


/*** VARS SSH KEYS ***/
variable "SSH_KEY_SG" {
  default = "vken27-ap-southeast-1"
}

variable "SSH_KEY_US" {
  default = "vken27-us-east-1"
}

variable "PRIVATE_KEY" {
  default = "vken27.pem"
}

variable "PUBLIC_KEY" {
  default = "vken27.pem.pub"
}

/*** VARS INSTANCE TYPE ***/

variable "INSTANCE_TYPE" {
  default = "t2.micro"
}

/*** VARS AVALABILITY ZONES ***/

variable "AZS" {
  type    = "list"
  default = ["ap-southeast-1a", "ap-southeast-1b"]
}

/*** VARS ALLOWED IP RANGE ***/

variable "ALLOWED_IPS" {
  type = "map"

  default = {
    all   = "0.0.0.0/0"
    local = "172.19.0.0/16"
  }
}


