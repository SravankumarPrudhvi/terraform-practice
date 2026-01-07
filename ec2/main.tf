resource "aws_security_group" "ec2_sg" {
  name     = "ec2-sg-${var.env}"
  description = "ec2 security group"


  ingress = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks =["0.0.0.0/0"]
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
<<<<<<< HEAD
  instance_type           = var.instance_type
  subnet_id               =var.subnet_id
=======
  instance_type          = var.instance_type
  subnet_id              =var.subnet_id
>>>>>>> b51f36afe53bb5a3a51f727e00c9f033ae14c87a
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]


tags = merge(var.tags, {name = "ec2-${var.env}"})

}
