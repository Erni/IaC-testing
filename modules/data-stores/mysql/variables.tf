# -------------------------------------------------------
# REQUIRED PARAMETERS
# You must provide a value for each of these parameters.
# -------------------------------------------------------
variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive   = true
  default     = null
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive   = true
  default     = null
}

variable "backup_retention_period" {
  type        = number
  description = "Days to retain backups. Must be > 0 to enable replication."
  default     = null
}

variable "replicate_source_db" {
  type        = string
  description = "If specified, replicate the RDS database at the given ARN"
  default     = null
}

# -------------------------------------------------------
# OPTIONAL PARAMETERS
# These parameters have reasonable defaults.
# -------------------------------------------------------
variable "db_name" {
  description = "The name to use for the database"
  type        = string
  default     = null
}