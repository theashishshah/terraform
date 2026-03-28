variable "ami" {
  description = "linux amazon machine image"
  type        = string
  default     = "ami-05d2d839d4f73aafb"
}


variable "instance_1" {
  description = "defines instance type"
  type        = string
  default     = "t2.small"
}

variable "instance_2" {
  description = "defines instance type"
  type        = string
  default     = "t2.micro"
}


variable "key_pair" {
  description = "aws key pair name"
  type        = string
  default     = "ashish-aws-root"
}
