# =========| LAUNCH CONFIG |=========

resource "aws_launch_configuration" "demo" {
  image_id               = "ami-0f9124f7452cdb2a6"
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.demo-instance.id]

  user_data              = <<EOF
#!/bin/bash
sudo apt-get update
sudo apt-get install apache2
ip_address=`curl -4 icanhazip.com`
echo "<h1>WEB Server with IP: $ip_address</h1><br><h3>Build by Terraform!</h3>" > /var/www/index.html
sudo service apache2 start
EOF

  # Required when using ASG in run config
  lifecycle {
    create_before_destroy = true
  }
}

# ==================================