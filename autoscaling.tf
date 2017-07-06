/*** LAUNCH CONFIG ***/

resource "aws_launch_configuration" "launch-config" {
  name_prefix             = "launch-config"
  image_id                = "${lookup(var.AMI_AMAZON_LINUX, var.AWS_REGION)}"
  instance_type           = "t2.micro"
  key_name                = "${aws_key_pair.ssh-key.key_name}"
  user_data               = "#!/bin/bash\nsudo yum install httpd -y\nsudo service httpd start\necho 'Hello World' > /var/www/html/index.html"
  security_groups         = ["${aws_security_group.allow-local.id}", "${aws_security_group.allow-web.id}", "${aws_security_group.allow-ssh.id}"]
}

/*** END LAUNCH CONFIG ***/

/*** AUTOSCALING GROUP ***/

resource "aws_autoscaling_group" "autoscaling-group-vken" {
  name                        = "autoscaling-group-vken"
  vpc_zone_identifier         = ["${aws_subnet.vpc1-public-subnet-1a.id}", "${aws_subnet.vpc1-public-subnet-1b.id}"]
  launch_configuration        = "${aws_launch_configuration.launch-config.name}"
  min_size                    = 2
  max_size                    = 2
  health_check_grace_period   = 300
  health_check_type           = "ELB"
  load_balancers              = ["${aws_elb.my-elb.name}"]
  force_delete                = true

  tag {
    key = "Name"
    value = "ec2 instance"
    propagate_at_launch = true
    
  }
}

/*** END AUTOSCALING GROUP ***/
