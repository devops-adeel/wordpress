resource "aws_lightsail_instance" "default" {
  name              = "custom_wordpress"
  availability_zone = local.az
  blueprint_id      = "wordpress"
  bundle_id         = "nano_2_0"
  key_pair_name     = aws_lightsail_key_pair.default.name
}

resource "aws_lightsail_key_pair" "default" {
  name = "wordpress"
}

resource "aws_lightsail_static_ip" "default" {
  name = "wordpress"
}

resource "aws_lightsail_static_ip_attachment" "default" {
  static_ip_name = aws_lightsail_static_ip.default.id
  instance_name  = aws_lightsail_instance.default.id
}

resource "aws_lightsail_domain" "default" {
  domain_name = "dev-properteers-wordpress-instance.com"
}
