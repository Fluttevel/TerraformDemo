# =========| VARIABLES |=========

variable "vpc-cidr" {
  default      = "10.0.0.0/16"
  description  = "VPC CIDR Block"
  type         = string
}

variable "vpc-cidr-0" {
  default      = "0.0.0.0/0"
  description  = "VPC CIDR Block 0"
  type         = string
}

variable "public-subnet-1-cidr" {
  default      = "10.0.10.0/24"
  description  = "Public Subnet 1 CIDR Block"
  type         = string
}

variable "public-subnet-2-cidr" {
  default      = "10.0.20.0/24"
  description  = "Public Subnet 2 CIDR Block"
  type         = string
}

variable "private-subnet-1-cidr" {
  default      = "10.0.11.0/24"
  description  = "Private Subnet 1 CIDR Block"
  type         = string
}

variable "private-subnet-2-cidr" {
  default      = "10.0.21.0/24"
  description  = "Private Subnet 2 CIDR Block"
  type         = string
}

variable "ssh-location" {
  default      = "0.0.0.0/0"
  description  = "IP Address that can SSH into the EC2 Instance"
  type         = string
}

variable "server_port" {
  default     = 8080
  description = "The port the server will use for HTTP requests"
  type        = number
}

# =================================