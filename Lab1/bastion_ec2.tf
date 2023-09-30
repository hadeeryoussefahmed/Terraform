

resource "aws_instance" "bastion-instence" {
ami ="ami-03a6eaae9938c858c"
instance_type = "t2.micro"
subnet_id = aws_subnet.public-subnet-useast1a.id
vpc_security_group_ids = [aws_security_group.sg.id]
key_name = aws_key_pair.tf-key-pair.id


user_data = <<-EOF
              #!/bin/bash
              echo '${tls_private_key.rsa-key.private_key_pem}' > /home/ec2-user/private_key.pem
              chmod 400 private_key.pem
              EOF

tags = {
    Name= "bastionHost_instance"
}

}