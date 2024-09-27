provider "aws" {
  region = "eu-west-1" 
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0fed63ea358539e44"  
  instance_type = "t2.micro"
  key_name      = "MyKeyPair"  # Use your EC2 key pair name

  tags = {
    Name = "Jenkins-Server"
  }

  security_groups = ["allow_ssh_http"]

  user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install java-11-openjdk-devel -y
    sudo yum install wget -y
    wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
    rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key
    sudo yum install jenkins -y
    sudo systemctl start jenkins
    sudo systemctl enable jenkins
  EOF
}

resource "aws_security_group" "allow_ssh_http" {
  name = "allow_ssh_http"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
