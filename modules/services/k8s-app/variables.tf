variable "name" {
  type = string
  description = "The name to use for all resources created by this module"
}

variable "image" {
  type = string
  description = "The docker image to run"
}

variable "container_port" {
  type = number
  description = "The port the docker image listens on"
}

variable "replicas" {
  type = number
  description = "How many replicas to run"
}

variable "environment_variables" {
  type = map(string)
  description = "Environment variables to set for the app"
  default = {}
}