variable "client_id" {
  type = string
  sensitive = true
}

variable "client_secret" {
  type = string
  sensitive = true
}

variable "cplane" {
  type = string
  sensitive = false
}

variable "root_org" {
  type = string
  sensitive = false
}

variable "env_id" {
  type = string
  sensitive = false
}