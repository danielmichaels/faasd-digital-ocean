# faasd on Digital Ocean

This repo uses Terraform to deploy a [faasd] instance on Digital Ocean.

This is an extension of this [guide] supplied by the [faasd] author [Alex Ellis][ae].

## Setup

To make best use of this repo, it is recommended you have [taskfile][tf] installed. If you don't want
to install it, read over the [Taskfile.yml](/Taskfile.yml) to see what commands to run.

### Pre-Requisites

- [Terraform] installed locally
- A [Digital Ocean][d] account and [API key][apik]
- A Domain name you control
- (optionally) The Domain is managed by Digital Ocean
- [faas-cli] installed (I suggest you get it via [arkade])
- This repo cloned locally

The rest of this guide assumes you're using [task][tf].

## Usage

**Step 1**

`task setup`

This will create the `main.auto.tfvars` file, check for terraform and faas-cli binaries
and initialise terraform.

After the `setup` is done you will **need** to update the `main.auto.tfvars`.
The following variables can be altered but `do_token` and `letsencrypt_email` must be provided.

   | Variable            | Description                                                                                                                                                                                                                    | Default             |
   |---------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------|
   | `do_token`          | Digitalocean API token                                                                                                                                                                                                         | None                |
   | `do_domain`         | Public domain used for the faasd gateway                                                                                                                                                                                       | None                |
   | `do_subdomain`      | Public subdomain used for the faasd gateway                                                                                                                                                                                    | `faasd`             |
   | `letsencrypt_email` | Email used by when ordering TLS certificate from Letsencrypt                                                                                                                                                                   | `""`                |
   | `do_create_record`  | When set to `true`, a new DNS record will be created. This works only if your domain (`do_domain`) is managed by Digitalocean                                                                                                  | `false`             |
   | `do_region`         | Digitalocean region for creating the droplet                                                                                                                                                                                   | `syd1`              |
   | `ssh_key_file`      | Path to public SSH key file                                                                                                                                                                                                    | `~/.ssh/id_rsa.pub` |
   | `droplet_image`     | Image type to use for the droplet                                                                                                                                                                                              | `ubuntu-22-04-x64`  |
   | `droplet_size`      | Size to use for the droplet                                                     <br/> <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/> <br/><br/> <br/> <br/><br/><br/><br/><br/> <br/> <br/> <br/> | `s-1vcpu-1gb`       |

**Step 2**

`task plan`

This will establish the Terraform plan and check that everything is going to work as expected.

**Step 3**

`task apply`

Applies the `plan` and will start creating the droplet. This will output some of the created droplet's values
however the login and password will not be displayed. 

**Step 4**

`task output`

The login and password for the newly created `faasd` instance will be output to the terminal.
Copy and paste the output, and it will log you into your faasd instance. From here you will be
able to manage the instead using `faas-cli`.

**Destroy**

To destroy the droplet run `task destroy` and type `yes` to confirm.

[faas-cli]: https://github.com/openfaas/faas-cli
[arkade]: https://github.com/alexellis/arkade
[d]: https://digitalocean.com
[apik]: https://docs.digitalocean.com/reference/api/api-reference/
[tf]: https://taskfile.dev
[guide]: https://github.com/openfaas/faasd/tree/master/docs/bootstrap/digitalocean-terraform
[ae]: https://github.com/alexellis
[faasd]: https://github.com/openfaas/faasd
