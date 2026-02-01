variable "root_org" {
  type        = string
  description = "The business group ID"
}

variable "env_id" {
  type        = string
  description = "The environment name"
}

variable "region_id" {
  type        = string
  description = "The region name"
}

variable "ANYPOINT_CLIENT_ID" {
  type        = string
  description = "The connected app's ID"
  sensitive   = true
}

variable "ANYPOINT_CLIENT_SECRET" {
  type        = string
  description = "The connected app's secret"
  sensitive   = true
}
