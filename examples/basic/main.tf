provider "anypoint" {
  client_id = var.client_id             # optionally use ANYPOINT_CLIENT_ID env var
  client_secret = var.client_secret     # optionally use ANYPOINT_CLIENT_SECRET env var

  # You may need to change the anypoint control plane: use 'eu' or 'us'
  # by default the control plane is 'us'
  cplane= var.cplane                    # optionnaly use ANYPOINT_CPLANE env var
}

module "amq" {
  source = "../../"

  root_org = var.root_org
  env_id = var.env_id
  id = "terraform-test"
  region_id = "eu-central-1"
}
