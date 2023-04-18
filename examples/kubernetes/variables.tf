
variable "cluster_version" {
  default = "1.26"
}

variable "worker_count" {
  default = 3
}

variable "worker_size" {
  default = "s-1vcpu-2gb"
}

variable "write_kubeconfig" {
  type        = bool
  default     = false
}

variable "do_token" {
  description = "Digital Ocean API Token"
}
