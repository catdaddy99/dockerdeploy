# Proxmox Provider
# ---
# Initial Provider Configuration for Proxmox

terraform {

    required_version = ">= 0.13.0"

#    required_providers {
#        proxmox = {
#            source = "telmate/proxmox"
#            version = ">= 2.9.14"
#        }
#    }
    required_providers {
        proxmox = {
            source = "Telmate/proxmox"
            version = "3.0.1-rc3"
        }
    }
}

/*
variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
}

variable "proxmox_api_token_secret" {
    type = string
}
*/

provider "proxmox" {

#    pm_api_url = var.proxmox_api_url
#    pm_api_token_id = var.proxmox_api_token_id
#    pm_api_token_secret = var.proxmox_api_token_secret

    pm_api_url = "https://10.77.2.15:8006/api2/json"
    pm_api_token_id = "root@pam!tfuser"
    pm_api_token_secret = "f83fc09a-849f-4c0d-85c2-f41b6a3cb5cc"    

#    # (Optional) Skip TLS Verification
#    # pm_tls_insecure = true

}

