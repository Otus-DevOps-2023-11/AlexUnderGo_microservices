provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

resource "yandex_compute_instance" "reddit" {
  count       = var.reddit_count
  name        = "reddit-${count.index}"
  platform_id = var.platform_id

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 50
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

  boot_disk {
    initialize_params {
      name     = "reddit-${count.index}-disk"
      type     = var.type
      size     = var.size
      image_id = var.image_id
    }
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
