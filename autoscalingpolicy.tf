#*** SCALE UP ALARM ***/

resource "aws_autoscaling_policy" "autoscale-cpu-policy" {
  name                   = "autoscale-cpu-policy"
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling-group-vken.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "autoscale-cpu-alarm" {
  alarm_name          = "autoscale-cpu-alarm"
  alarm_description   = "autoscale-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling-group-vken.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.autoscale-cpu-policy.arn}"]
}

#*** END SCALE UP ALARM ***/

#*** SCALE DOWN ALARM ***/
resource "aws_autoscaling_policy" "autoscale-cpu-policy-scaledown" {
  name                   = "autoscale-cpu-policy-scaledown"
  autoscaling_group_name = "${aws_autoscaling_group.autoscaling-group-vken.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "autoscale-cpu-alarm-scaledown" {
  alarm_name          = "autoscale-cpu-alarm-scaledown"
  alarm_description   = "autoscale-cpu-alarm-scaledown"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.autoscaling-group-vken.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.autoscale-cpu-policy-scaledown.arn}"]
}

#*** END SCALE DOWN ALARM ***/
