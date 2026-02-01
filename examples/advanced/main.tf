module "amq" {
  source = "../.."
  #version = "0.1.0"

  # Required variables
  root_org  = var.root_org
  env_id    = var.env_id
  id        = "terraform-test"
  region_id = var.region_id

  # Optional - Advanced configuration
  fifo = true
  message_ttl             = 1209600000  # 14 days
  default_ack_timeout     = 180000      # 3 minutes
  default_delivery_delay  = 3           # 3 seconds

  # Dead Letter Queue configuration
  dlq_id                  = "test-dlq"
  dlq_reroute_attempts    = 5
}
