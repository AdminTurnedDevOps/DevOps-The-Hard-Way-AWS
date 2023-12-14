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

variable "kubernetes_cluster_rbac_enabled" {
  default = "true"
}

variable "kubernetes_version" {
}

variable "agent_count" {
}

variable "vm_size" {
}

variable "ssh_public_key" {
}

variable "aks_admins_group_object_id" {
}

variable "tags" {
  type = map(string)
}