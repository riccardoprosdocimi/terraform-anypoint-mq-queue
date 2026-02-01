variable "root_org" {
	type = string
	description = "The organization ID where the Anypoint MQ is defined"
}

variable "env_id" {
	type = string
	description = "The environment ID where the Anypoint MQ is defined"
}

variable "fifo" {
	type = bool
	description = "Whether to make this queue a FIFO"
	default = false
}

variable "id" {
  type        = string
  description = "The unique ID of this Anypoint MQ"

  validation {
    condition     = can(regex("^[A-Za-z0-9.-]+$", var.id))
    error_message = "Queue ID can only use alphanumeric, hyphens, or periods"
  }
}

variable "message_ttl" {
  type        = number
  description = "The default TTL applied to messages in milliseconds"
  default     = 604800000
}

variable "default_ack_timeout" {
	type = number
	description = "The default time to live of the created locks in milliseconds"
	default = 120000
}

variable "default_delivery_delay" {
	type = number
	description = "The default delivery delay in seconds"
	default = null
}

variable "dlq_id" {
	type = string
	description = "The queue ID of the dead letter queue to bind to this queue. A FIFO DLQ only works with FIFO queues"
	default = null
}

variable "dlq_reroute_attempts" {
	type = number
	description = "The maximum number of attempts after which the message will be routed to DLQ. This field can only be used when dead_letter_queue_id attribute is present"
	default = null

	validation {
    condition = (
      (var.dlq_id == null && var.dlq_reroute_attempts == null) ||
      (var.dlq_id != null && var.dlq_reroute_attempts != null)
    )
    error_message = "dead_letter_queue_id and max_deliveries must either both be set or both be unset"
  }
}

variable "region_id" {
	type = string
	description = "The region ID where the Anypoint MQ is defined. Refer to Anypoint Platform official documentation for the list of available regions"
}
