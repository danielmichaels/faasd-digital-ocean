# Your Digital Ocean API key
do_token          = ""

# Required for TLS on faasd instance
letsencrypt_email = ""

# Use an existing key in digital ocean
do_existing_ssh_key = ["1234567"]
# Create a Digital Ocean A record if set to true
# must provide a domain and subdomain if DO is
# to manage your DNS
do_create_record = false
do_domain         = ""
do_subdomain      = ""
