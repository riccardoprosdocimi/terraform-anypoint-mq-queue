module "amq" {
  source = "../.."
  #version = "0.1.0"

  # Required variables
  root_org  = var.root_org
  env_id    = var.env_id
  id        = "terraform-test"
  region_id = var.region_id
}
