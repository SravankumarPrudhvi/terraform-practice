resource "aws_security_group" "ec2_sg" {
  name     = "ec2-sg-${var.env}"
  description = "ec2 security group"


  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =var.allowed_ssh_cidr
  }

  egress = {
    from_port   = 22
    to_port     = 22
    protocol    = "-1"
    cidr_blocks =["0.0.0.0/0"]
  }
}

resource "aws_instance" "ec2_modules" {
  ami                      = var.ami_id
  instance_type           = var.instance_type
  subnet_id               =var.subnet_id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name = var.key_name

tags ={
  name = "app-ec2-${var.env}"
}

}
