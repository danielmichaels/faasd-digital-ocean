variable "do_token" {
  description = "Digitalocean API token"
}
variable "do_domain" {
  description = "Your public domain"
}
variable "do_subdomain" {
  description = "Your public subdomain"
  default     = "faasd"
}
variable "letsencrypt_email" {
  description = "Email used to order a certificate from Letsencrypt"
}
variable "do_create_record" {
  default     = false
  description = "Whether to create a DNS record on Digitalocean"
}
variable "do_region" {
  default     = "syd1"
  description = "The Digitalocean region where the faasd droplet will be created."
}
variable "droplet_image" {
  default = "ubuntu-20-04-x64"
  description = "Droplet image <ref: https://slugs.do-api.dev>"
}
variable "droplet_name" {
  default = "faasd"
  description = "Droplet name"
}
variable "droplet_size" {
  default = "s-1vcpu-1gb"
  description = "Size of the droplet <ref: https://slugs.do-api.dev>"
}
variable "do_existing_ssh_key" {
  description = "The NAME of the SSH key which already exists in Digital Ocean"
  type = list(string)
}
