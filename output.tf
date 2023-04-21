output "droplet_ip" {
  value = digitalocean_droplet.faasd.ipv4_address
}

output "gateway_url" {
  value = "https://${var.do_subdomain}.${var.do_domain}/"
}

output "password" {
  value     = random_password.password.result
  sensitive = true
}

output "login_cmd" {
  value     = " echo ${random_password.password.result} | faas-cli login -g https://${var.do_subdomain}.${var.do_domain}/ --password-stdin "
  sensitive = true
}
