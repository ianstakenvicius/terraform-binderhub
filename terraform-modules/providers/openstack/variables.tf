variable "nb_nodes" {
  description = "Number of nodes"
}

variable "instance_volume_size" {
  description = "Volume size for each instance"
}

variable "ssh_authorized_keys" {
  description = "List of public SSH keys that can connect to the cluster"
  type    = "list"
}

variable "os_flavor_node" {
  description = "Node flavor"
}

variable "os_flavor_master" {
  description = "Master flavor"
}

variable "admin_user" {
  description = "User with root access (provider module output)"
  default     = "ubuntu"
}

variable "project_name" {
  description = "Unique project name"
}

variable "image_name" {
  description = "Disk image name"
}

variable "is_computecanada" {
  description = "Set true if hosted on ComputeCanada"
  default     = false
}

variable "cc_private_network" {
  description = "Private network to join (must be set on ComputeCanada)"
  default     = ""
}

variable "docker_registry_url" {
  description = "Regisrty url if using private registry"
  default     = "docker.io"
}

variable "docker_id" {
  description = "Username for docker"
}

variable "docker_password" {
  description = "Password for docker"
}
