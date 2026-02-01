# data "anypoint_amq" "dlq" {
#   count    = var.dlq_id != null ? 1 : 0
#   org_id   = var.root_org
#   env_id   = var.env_id
# 	region_id = var.region_id

# 	params {
# 		destination_ids = [var.dlq_id]
# 	}
# }

resource "anypoint_amq" "this" {
	org_id = var.root_org
	env_id = var.env_id
	fifo = var.fifo
	queue_id = var.id
	default_ttl = var.message_ttl
	default_lock_ttl = var.default_ack_timeout
	default_delivery_delay = var.default_delivery_delay
	encrypted = true
	dead_letter_queue_id = var.dlq_id
	max_deliveries = var.dlq_reroute_attempts
	region_id = var.region_id

	# lifecycle {
	# 	# Check if DLQ exists
	# 	precondition {
  #     condition = (
	# 			var.dlq_id == null ||
  #     	(length(data.anypoint_amq.dlq) == 1 && 
	# 			length(data.anypoint_amq.dlq[0].queues) == 1)
  #     )
  #     error_message = "The dead letter queue inserted does not exist in the specified environment and region. Please create it first or verify the queue ID is correct"
  #   }
  #   # Check if FIFO compatibility matches
  #   precondition {
  #     condition = (
  #       var.fifo == false ||
  #     	var.dlq_id == null ||
  #     	(length(data.anypoint_amq.dlq) == 1 && 
	# 			length(data.anypoint_amq.dlq[0].queues) == 1 && 
	# 			data.anypoint_amq.dlq[0].queues[0].fifo == true)
  #     )
  #     error_message = "If the queue is FIFO, the dead letter queue must also be FIFO. The queue inserted is not a FIFO queue"
  #   }
  # }
}
