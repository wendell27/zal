/*** SSH KEY ***/

resource "aws_key_pair" "ssh-key" {
  key_name   = "vken27-personal-ap-southeast-1"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}

/*** END SSH KEY ***/