terraform {
  required_version = ">= 1.3.0"

  required_providers {
    anypoint = {
      source  = "mulesoft-anypoint/anypoint"
      version = "~> 1.8.2"
    }
  }
}

provider "anypoint" {
  client_id     = var.ANYPOINT_CLIENT_ID
  client_secret = var.ANYPOINT_CLIENT_SECRET
}
