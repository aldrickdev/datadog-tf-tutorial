# Import the Datadog Provider
terraform {
  required_providers {
    datadog = {
      source = "DataDog/datadog"
    }
  }
}

# Define the variables
variable "datadog_api_key" {
  description = "Datadog API Key"
}

variable "datadog_app_key" {
  description = "Datadog App Key"
}

# Configure the Datadog Provider
provider "datadog" {
  api_key = var.datadog_api_key
  app_key = var.datadog_app_key
}

# Define the Monitor
resource "datadog_monitor" "foo" {
  name               = "Foo Monitor created by Terraform"
  type               = "metric alert"
  message            = "Monitor triggered. Notify: @hipchat-channel"
  escalation_message = "Escalation message @pagerduty"

  query = "avg(last_1h):avg:aws.ec2.cpu{environment:foo,host:foo} by {host} > 4"

  monitor_thresholds {
    warning  = 2
    critical = 4
  }

  include_tags = true

  tags = ["foo:bar", "team:fooBar"]
}