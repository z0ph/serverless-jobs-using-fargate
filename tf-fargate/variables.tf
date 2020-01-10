variable "aws_region" {
  default = "eu-west-1"
  description = "AWS Region"
}

variable "env" {
  default     = "dev"
  description = "Environment"
}

variable "project" {
  default     = "no-project-name"
  description = "Project Name"
}

variable "description" {
  default     = "empty-project-description"
  description = "Project Description"
}

variable "artifacts_bucket" {
  default     = "no-artifact-bucket-defined"
  description = "Artifacts Bucket Name"
}

variable "ecs_event_role" {
  default     = "XXX"
  description = "IAM Role used for CloudWatch"
}

variable "ecs_taskexec_role" {
  default     = "XXX"
  description = "IAM Role used for Task Execution"
}

variable "subnets_ids" {
  type        = "list"
  default     = ["XXX"]
  description = "Subnets IDs used for Fargate Containers"
}

variable "security_groups_ids" {
  type        = "list"
  default     = ["XXX"]
  description = "Security Groups IDs used for Fargate"
}

variable "schedule" {
  default     = "rate(X hours)"
  description = "Schedule for your job"
}

variable "assign_public_ip" {
  default     = "false"
  description = "Set public IP on Fargate Container"
}

variable "ecs_cpu_units" {
  default     = "1024"
  description = "Container: Number of CPU Units"
}

variable "ecs_memory" {
  default     = "2048"
  description = "Container: Memory in MB"
}

variable "ecr_image_uri" {
  default     = "123456789012.dkr.ecr.xxxxx.amazonaws.com/xxxx:lastone"
  description = "URI of the Docker Image in ECR"
}


