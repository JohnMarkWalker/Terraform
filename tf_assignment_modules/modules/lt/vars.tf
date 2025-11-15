variable "iowner" {
    description = "instance owner name"
  type = string
}

variable "ami_id" {
  description = "machine image id"
  type = string
}

variable "itype" {
  description = "instance type"
  type = string
}

variable "kpem" {
  description = "security key"
  type = string
}