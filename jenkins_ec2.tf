resource "aws_instance" "jenkins" {
    ami= "ami-04b9e92b5572fa0d1"
    instance_type= "t2.micro"
    key_name= "jenkins"
    security_groups = ["launch-wizard-1"]
    tags = {
        "Name" = "jenkins" 
    }
connection {
    type= "ssh"
    user= "ubuntu"
    host= "${aws_instance.jenkins.public_ip}"
    private_key= "${file("./jenkins.pem")}"
}
 provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "/tmp/script.sh args",
    ]
  }
}
