variable "environment" {
  type = string
}

variable "identifier" {
  type = string
}

variable "kubernetes_version" {
  type = string
}

variable "location" {
  type = string
}

variable "log_analytics_workspace_id" {
  type = string
}

variable "node_count" {
  type    = number
  default = 1
}

variable "resource_group_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "tags" {
  type    = map(string)
  default = {}
}

variable "vm_size" {
  type    = string
  default = "Standard_DS2_v3"
}

variable "workload_name" {
  type = string
}

variable "workload_type" {
  type = string
}

variable "workload_version" {
  type = string
}

variable "zone" {
  type = string
}

variable "zones" {
  type = list(string)
  default = [
    "1",
    "2",
    "3"
  ]
}
