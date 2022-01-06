source "amazon-ebs" "ubuntu" {
  ami_name      = "packer-ubuntu-aws-{{timestamp}}"
  instance_type = "t2.micro"
  region = "us-east-1"
  source_ami_filter {
    filters = {
      name                = "ubuntu/images/*ubuntu-xenial-16.04-amd64-server-*"
      root-device-type    = "ebs"
      virtualization-type = "hvm"
    }
    most_recent = true
    owners      = ["amazon"]

  }

  ssh_username = "ubuntu"

  tags = {
    "Name"        = "MyUbuntuImage"
    "Environment" = "Production"
    "OS_Version"  = "Ubuntu 20.04"
    "Release"     = "Latest"
    "Created-by"  = "Packer"
     "lifecycle": "authorized"
 }

    ssh_timeout = "10m"


  vault_aws_engine {
    name = "my-role"
  }

}

build {
  sources = ["source.amazon-ebs.ubuntu"]

  provisioner "shell" {
        script = "docker-install.sh"
  }
  
  provisioner "shell" {
        script = "git installer.sh"
  }

}
