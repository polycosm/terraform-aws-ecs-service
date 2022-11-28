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

variable "hostname" {
  description = "The hostname on which to advertise the service."
  type        = string
}

variable "initial_desired_count" {
  description = "The number of task that the service should run initially"
  default     = 0
}

variable "load_balancer" {
  description = "The load balancer configuration to use."
  type = object({
    arn               = string
    dns_name          = string
    https_listener_id = string
    zone_id           = string
  })
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
  type = object({
    private_subnets = list(string)
    vpc_id          = string
  })
}

variable "port" {
  description = "The container ingress ports"
  type        = number
}

variable "task_definition" {
  description = "The ECS task definition to use"
  type = object({
    arn = string
  })
}

variable "zone" {
  description = "The Route53 zone in which to create the service record"
  type = object({
    id = string
  })
}
