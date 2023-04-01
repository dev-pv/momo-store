resource "yandex_compute_instance" "vm-1" {

  name        = "linux-vm"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = "2"
    memory = "4"
  }

  boot_disk {
    initialize_params {
      image_id = "fd8htuc6bfu35rt5476e"
    }
  }

  network_interface {
    subnet_id = "e9bulnd421eipra1r4rb"
    nat       = true
  }

  metadata = {
    user-data = "${file("cloud-init.yaml")}"
  }
}

resource "yandex_vpc_address" "addr" {
  name = "vm_pub_ip"
  external_ipv4_address {
    zone_id = "ru-central1-a"
  }
}
