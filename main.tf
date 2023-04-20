resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "_-#"
}
data "template_file" "cloud_init" {
  template = file("cloud-config.tpl")
  vars = {
    gw_password       = random_password.password.result,
    faasd_domain_name = "${var.do_subdomain}.${var.do_domain}"
    letsencrypt_email = var.letsencrypt_email
  }
}

resource "digitalocean_ssh_key" "faasd_ssh_key" {
  name       = "ssh-key"
  public_key = file(var.ssh_key_file)
}

resource "digitalocean_droplet" "faasd" {
  region    = var.do_region
  image     = var.droplet_image
  name      = var.droplet_name
  size      = var.droplet_size
  user_data = data.template_file.cloud_init.rendered
  ssh_keys = [
    digitalocean_ssh_key.faasd_ssh_key.id
  ]
}

resource "digitalocean_record" "faasd" {
  domain = var.do_domain
  type   = "A"
  name   = var.do_subdomain
  value  = digitalocean_droplet.faasd.ipv4_address
  # Only creates record if do_create_record is true
  count = var.do_create_record == true ? 1 : 0
}
