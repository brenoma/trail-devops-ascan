resource "aws_cloudwatch_dashboard" "ec2-dashboard" {
  dashboard_name = "ec2-dashboard"
  dashboard_body = <<EOF
{
    "widgets": [
        {
            "type": "explorer",
            "width": 24,
            "height": 15,
            "x": 0,
            "y": 0,
            "properties": {
                "metrics": [
                    {
                        "metricName": "CPUUtilization",
                        "resourceType": "AWS::EC2::Instance",
                        "stat": "Maximum"
                    }
                ],
                "aggregateBy": {
                    "key": "InstanceType",
                    "func": "MAX"
                },
                "labels": [
                    {
                        "key": "State",
                        "value": "running"
                    }
                ],
                "widgetOptions": {
                    "legend": {
                        "position": "bottom"
                    },
                    "view": "timeSeries",
                    "rowsPerPage": 8,
                    "widgetsPerRow": 2
                },
                "period": 60,
                "title": "Running EC2 Instances CPUUtilization"
            }
        }
    ]
}
EOF
}

resource "aws_cloudwatch_log_group" "ebs-log-group" {
  name = "ebs-log-group"
  retention_in_days = var.RETENTION_DAYS
}

resource "aws_cloudwatch_log_stream" "ebs-log-stream" {
  name = "ebs-log-stream"
  log_group_name = aws_cloudwatch_log_group.ebs-log-group.name
}

resource "aws_sns_topic" "ec2-topic" {
  name = "ec2-topic"
}

resource "aws_sns_topic_subscription" "ec2-subscription" {
  endpoint  = "breno_araripe@atlantico.com.br"
  protocol  = "email"
  topic_arn = aws_sns_topic.ec2-topic.arn
}

resource "aws_cloudwatch_metric_alarm" "ec2-cpu-usage-alarm" {
  alarm_name          = "ec2-cpu-usage-alarm"
  alarm_description = "Metric to monitor EC2 cpu utilization when exceed 70%"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = 2

  metric_name = "CPUUtilization"
  namespace = "AWS/EC2"
  period = "360"
  statistic = "Average"
  threshold = "70"
}

resource "aws_cloudwatch_composite_alarm" "ec2-" {
  alarm_name = "EC2_Composite_Alarm"
  alarm_description = "Composite alarm to monitor CPU utilization."
  alarm_actions = [aws_sns_topic.ec2-topic.arn]
  alarm_rule = "ALARM(${aws_cloudwatch_metric_alarm.ec2-cpu-usage-alarm.alarm_name})"
  depends_on = [
    aws_cloudwatch_metric_alarm.ec2-cpu-usage-alarm,
    aws_sns_topic.ec2-topic,
    aws_sns_topic_subscription.ec2-subscription
  ]
}