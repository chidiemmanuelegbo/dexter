#variable file

variable "vpc-cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "tenancy-state" {
  type        = string
  default     = "default"
  description = "making tenancy state variable"
}

variable "region-name" {
  type        = string
  default     = "eu-west-2"
  description = "making region-name variable"
}

variable "domain-change" {
  type        = bool
  default     = true
  description = "enabling dns"
}

variable "pub-cidr1" {
    default = "10.0.100.0/24"
}

variable "pub-cidr2" {
    default = "10.0.150.0/24"
}

variable "az1" {
default = "eu-west-2c"
}