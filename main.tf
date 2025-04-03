

#variable "az" {}

resource "proxmox_lxc" "docker2" {
  target_node  = "proxmox1"
  hostname     = "docker2"
  ostemplate   = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  #clone = "ubuntuansiblereadytemp"
  password     = "B00TY"
  unprivileged = true
  nameserver = "10.77.2.10 10.77.2.11"
  searchdomain = "weknowles.com"
  memory = "1024"
  swap = "1024"
  cores = "2"
  onboot = "true"
  start = "true"

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHBJA1Rrc+MXik7w7JhXASTIDVTu2J5ntoYYBE/47Zas tfuserkey
  EOT  

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "cephdrive1"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "10.77.2.80/24"
    tag = 2
    gw = "10.77.2.1"  
  }
}

resource "proxmox_lxc" "docker3" {
  target_node  = "proxmox1"
  hostname     = "docker3"
  ostemplate   = "local:vztmpl/ubuntu-24.04-standard_24.04-2_amd64.tar.zst"
  #clone = "ubuntuansiblereadytemp"
  password     = "B00TY"
  unprivileged = true
  nameserver = "10.77.2.10 10.77.2.11"
  searchdomain = "weknowles.com"
  memory = "1024"
  swap = "1024"
  cores = "2"
  onboot = "true"
  start = "true"

  ssh_public_keys = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIHBJA1Rrc+MXik7w7JhXASTIDVTu2J5ntoYYBE/47Zas tfuserkey
  EOT  

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "cephdrive1"
    size    = "20G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "10.77.2.81/24"
    tag = 2
    gw = "10.77.2.1"  
  }
}
