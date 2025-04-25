resource "aws_instance" "bastion" {
  ami           = "ami-084568db4383264d4" # Amazon Linux 2 in us-east-1
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.public_a.id
  key_name      = "myKeyAnu24_04_02" # Replace with your actual key name
  security_groups = [aws_security_group.bastion.id]

  tags = {
    Name = "BastionHost"
  }
}

resource "aws_instance" "jenkins" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_a.id
  key_name      = "myKeyAnu24_04_02"
  security_groups = [aws_security_group.private_instances.id]

  tags = {
    Name = "JenkinsServer"
  }
}

resource "aws_instance" "app" {
  ami           = "ami-084568db4383264d4"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.private_b.id
  key_name      = "myKeyAnu24_04_02"
  security_groups = [aws_security_group.private_instances.id]

  tags = {
    Name = "AppServer"
  }
}

resource "aws_eip" "bastion_eip" {
  instance = aws_instance.bastion.id
   domain  ="vpc" 
}

output "bastion_eip" {
  value = aws_eip.bastion_eip.public_ip
}

