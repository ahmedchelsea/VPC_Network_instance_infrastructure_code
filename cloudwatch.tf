resource "aws_cloudwatch_metric_alarm" "aws_ec2_cloudwatch-alarm" 
  alarm_name                = "ahmed_cloud_watch-alarm"
  comparison_operator       = "GreaterThanUpperThreshold"
  evaluation_periods        = "5"
  threshold_metric_id       = "80"
  alarm_description         = "This metric monitors ec2 cpu utilization"
  insufficient_data_actions = []