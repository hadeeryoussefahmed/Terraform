#generate public and private keypair
resource "tls_private_key" "rsa-key-private" {
    algorithm = "RSA"
    rsa_bits = 4096
  
}

#create aws keypair by public key from tls_private_key 
resource "aws_key_pair" "tf-key-pair-private" {
    key_name ="tf-key-pair-private"
    public_key = tls_private_key.rsa-key-private.public_key_openssh
  
}

#store private keypair into my machine to use it with ssh connect
resource "local_file" "tf-key-private"{
    content =tls_private_key.rsa-key-private.private_key_pem
    filename = "tf-key-pair-private.pem"
  
}