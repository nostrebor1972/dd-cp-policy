terraform {
  required_providers {
    checkpoint = {
      source  = "CheckPointSW/checkpoint"
      version = "2.9.0"
    }
  }
}

provider "checkpoint" {
  # Configuration options
  # session_name = "terraform"
}