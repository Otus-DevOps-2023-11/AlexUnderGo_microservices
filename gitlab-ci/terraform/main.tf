provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_disk" "gitlab-disk" {
  name     = "gitlab-disk"
  type     = var.type
  zone     = var.zone
  size     = var.size
  image_id = var.image_id
}

resource "yandex_compute_instance" "gitlab" {
  name        = "vm-gitlab"
  platform_id = var.platform_id

  resources {
    cores         = 2
    memory        = 4
    core_fraction = 50
  }

  boot_disk {
    disk_id = yandex_compute_disk.gitlab-disk.id
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  connection {
    type  = "ssh"
    host  = self.network_interface[0].nat_ip_address
    user  = "ubuntu"
    agent = true
  }
}
