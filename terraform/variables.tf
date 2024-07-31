variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-west-2"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "The CIDR block for the public subnet"
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  description = "The CIDR block for the private subnet"
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  description = "The instance type to use for the EC2 instances"
  default     = "t2.micro"
}

variable "ami" {
  description = "The AMI ID for the EC2 instances"
  default     = "ami-0bb87453e9e2ee2a9" # Ubuntu image with docker and mysql5.7 image (if not available creating on ami which has docker and mysql5.7)
}
