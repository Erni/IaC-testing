variable "name" {
  description = "The name to use for the EKS cluster"
  type = string
}

variable "min_size" {
  description = "minimum number of nodes to have in the EKS cluster"
  type = number
}

variable "max_size" {
    description = "maximum number of nodes to have in the EKS cluster"
    type = number
}

variable "desired_size" {
  description = "Desired number of nodes to have in the EKS cluster"
  type = number
}

variable "instance_types" {
  description = "The types of EC2 instances to run in the node group"
  type = list(string)
}