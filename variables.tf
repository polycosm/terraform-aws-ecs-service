variable "cluster" {
  description = "The cluster to use"
  type = object({
    id = string
  })
}

variable "cpu" {
  description = "The number of CPU units required by the task"
  type        = number
}

variable "egress_ports" {
  description = "The container egress ports"
  type        = list(number)
  default     = [0]
}

variable "ingress_ports" {
  description = "The container ingress ports"
  type        = list(number)
  default     = []
}

variable "initial_desired_count" {
  description = "The number of task that the service should run initially"
  default     = 0
}

variable "load_balancer_config" {
  description = "The load balancer configuration to use, if any"
  type = object({
    target_group_arn = string
    container_name   = string
    container_port   = string
  })
  default = null
}

variable "memory" {
  description = "The amount of memory required by the task"
  type        = number
}

variable "name" {
  description = "The name of the ECS service."
  type        = string
}

variable "network" {
  description = "The network to use"
  type = objec({
    private_subnets = list(string)
    vpc_id          = string
  })
}

variable "task_definition" {
  description = "The ECS task definition to use"
  type = object({
    arn = string
  })
}
