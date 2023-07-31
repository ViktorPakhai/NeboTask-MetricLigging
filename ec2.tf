module "ec2_instance" {
  source = "terraform-aws-modules/ec2-instance/aws"

  name                   = var.instance_name
  ami                    = var.ami_linux
  instance_type          = var.instance_type
  key_name               = var.ssh_key
  iam_instance_profile   = var.IAM_role
  monitoring             = true
  subnet_id              = aws_subnet.public-eu-west-1a.id
  vpc_security_group_ids = [aws_security_group.SG-WebServ.id]

    user_data = <<EOF
#!/bin/bash
sudo yum update -y
sudo amazon-linux-extras install php7.2 -y
sudo yum -y install httpd
sudo yum -y install mod_ssl
sudo yum -y install git
sudo yum -y install awslogs
sudo yum -y install amazon-cloudwatch-agent
sudo yum install -y https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
sudo systemctl status amazon-ssm-agent
sudo systemctl start amazon-ssm-agent
sudo systemctl enable httpd
sudo git clone https://github.com/ViktorPakhai/TestPHPApp.git
cd TestPHPApp
sudo rm -rv /var/www/html/index.html
sudo cp *  /var/www/html/
cd /root/
sudo git clone https://github.com/ViktorPakhai/https://github.com/ViktorPakhai/NeboTask-MetricLigging.git.git
cd /NeboTask-MetricLigging/
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:config-CWagent.json -s
sudo systemctl start httpd
sudo systemctl restart httpd
sudo service awslogsd start
sudo systemctl enable awslogsd
EOF

  tags = {
    Terraform = "true"

  }
}
