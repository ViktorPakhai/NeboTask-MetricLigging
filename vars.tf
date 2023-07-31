variable "multi_az" {
  description = "Specifies if the RDS instance is multi-AZ"
  type        = bool
  default     = true
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type"
  default     = "t2.micro"

}
variable "ssh_key" {
  type        = string
  description = "EC2 instance ssh key"
  default     = "privateAWS-viktor@pakhai-Irland-2023"
}

variable "ami_linux" {
  type        = string
  description = "AMI"
  #default     = "ami-004359656ecac6a95" eu-central
  default = "ami-006be9ab6a140de6e" #  Amazon Linux 2 Kernel 5.10 AMI 2.0.20230719.0 x86_64 HVM gp2

}


variable "instance_name" {
  type        = string
  description = "name for ec2"
  default     = "WebServer-Nebo"

}

variable "IAM_role" {
  type        = string
  description = "SSM for EC2"
  default     = "EC2-SDG-SSM"

}
variable "ssl_cert_arn" {
  type        = string
  description = "arn for ssl cert"
  #default     = "arn:aws:acm:eu-central-1:882166133385:certificate/2a16a52d-4f65-46c4-aa5a-d9ffefbf744d" #Frankfurt
  default = "arn:aws:acm:us-east-1:882166133385:certificate/97a11ed4-2e93-4ce1-8d1e-d9f3aae850ed" # Verginia

}
