resource "aws_instance" "labsquire_ec2" {
  ami                         = var.ec2_ami_id
  instance_type               = var.ec2_instance_type
  vpc_security_group_ids      = [aws_security_group.labsquire-sg.id]
  subnet_id                   = aws_subnet.public[0].id
  key_name                    = var.key_name
  associate_public_ip_address = true

  # Override the default root volume
  root_block_device {
    volume_type = "gp3"
    volume_size = 20  # You can adjust root size
    delete_on_termination = true
  }

  user_data = <<-EOF
              #!/bin/bash
              set -eux

              # Wait for cloud-init to finish before doing anything
              cloud-init status --wait

              # Format and mount EBS volume
              mkfs -t ext4 /dev/xvdf || true
              mkdir -p /labs
              mount /dev/xvdf /labs
              echo "/dev/xvdf /labs ext4 defaults,nofail 0 2" >> /etc/fstab

              # Create the user
              useradd -m -s /bin/bash labsquire

              # Set up SSH directory and authorized_keys
              mkdir -p /home/labsquire/.ssh
              echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQC...your-ssh-public-key..." > /home/labsquire/.ssh/authorized_keys
              chown -R labsquire:labsquire /home/labsquire/.ssh
              chmod 700 /home/labsquire/.ssh
              chmod 600 /home/labsquire/.ssh/authorized_keys

              # Install and enable NGINX
              apt-get update -y
              apt-get install -y nginx
              systemctl enable nginx
              systemctl start nginx
              EOF


  tags = {
    Name = "${var.project_name}-ec2"
  }
}

# 100 GB EBS volume (separate data volume)
resource "aws_ebs_volume" "app_data" {
  availability_zone = var.ec2_availability_zone
  size              = 100
  type              = "gp3"

  tags = {
    Name = "${var.project_name}-ebs-volume"
  }
}

# Attach the 100 GB volume to the instance
resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdf"
  volume_id   = aws_ebs_volume.app_data.id
  instance_id = aws_instance.labsquire_ec2.id
  force_detach = true
}
