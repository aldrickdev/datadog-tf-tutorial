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
resource "datadog_monitor" "foo" {}
