variable "name" {
  type        = string
  default     = "devopsthehardway"
  description = "Name for resources"
}

variable "location" {
  type        = string
  default     = "uksouth"
  description = "Azure Location of resources"
}

variable "tags" {
  type = map(string)
}