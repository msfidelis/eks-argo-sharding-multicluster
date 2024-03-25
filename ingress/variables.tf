variable "name" {
  default = "product-ingress"
}

variable "internal" {
  default = false
}

variable "ingress_type" {
  default = "application"
}

variable "shard_weight" {
  default = {
    shard_01 = 50,
    shard_02 = 50
  }
}