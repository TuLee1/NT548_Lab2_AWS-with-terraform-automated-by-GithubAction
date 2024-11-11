variable "region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "Availability Zone"
  default     = "us-east-1a"
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  default     = "ami-063d43db0594b521b"  # Amazon Linux 2 AMI
}

variable "instance_type" {
  description = "Instance type for the EC2 instance"
  default     = "t2.micro"
}
