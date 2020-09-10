provider "scaleway" {
    organization_id = var.orgID
    zone            = var.zoneName
    region          = var.regionName
}

resource "scaleway_instance_ip" "public_ip" {}

resource "scaleway_instance_volume" "opt" {
  size_in_gb = 100
  type = "b_ssd"
}

resource "scaleway_instance_server" "mailu" {
  type  = "DEV1-S"
  image = "centos_7.6"

  tags = [ "nxc", "filestore" ]

  additional_volume_ids = [ scaleway_instance_volume.opt.id ]

  ip_id = scaleway_instance_ip.public_ip.id
  
  }
