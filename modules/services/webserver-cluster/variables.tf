variable "cluster_name" {
  type = string
  description = "The name to use for all the cluster resources"
}

variable "db_remote_state_bucket" {
  type = string
  description = "The name of the S3 bucket for the database´s remote state"
  default = "ernesto-reig-terraform-st"
}

variable "db_remote_state_key" {
  type = string
  description = "The path for the databases´s remote state in S3"
}

variable "instance_type" {
  type = string
  description = "The type of EC2 instances to run (e.g. t2.micro)"
}

variable "min_size" {
  type = string
  description = "The minimum number of EC2 Instances in the ASG"
}

variable "max_size" {
  type = string
  description = "The maximum number of EC2 Instances in the ASG"
}

variable "server_port" {
  description = "The http port to be used"
  type        = number
  default     = 8080
}

variable "ami" {
  type        = string
  description = "The AMI to run in the cluster"
  default     = "ami-0fb653ca2d3203ac1"
}

variable "server_text" {
  type        = string
  description = "The text the web server should return"
  default     = "Hello World again!"
}