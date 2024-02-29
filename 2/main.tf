# #Сеть для Web
resource "yandex_vpc_network" "develop" {
  name = var.vm_web_vpc_name
}

# Подсеть для  Web
resource "yandex_vpc_subnet" "develop" {
  name           = var.vm_web_vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.vm_web_default_cidr
}


#Сеть для DB
resource "yandex_vpc_network" "db_develop" {
  name = var.vm_db_vpc_name
}

# Подсеть для DB
resource "yandex_vpc_subnet" "db_develop" {
  name           = var.vm_db_vpc_name
  zone           = var.vm_db_default_zone
  network_id     = yandex_vpc_network.db_develop.id
  v4_cidr_blocks = var.vm_db_default_cidr
}



data "yandex_compute_image" "ubuntu" {
  family = var.vm_web_family_os 
}

# Машина Web
resource "yandex_compute_instance" "platform" {
  name        = local.vm_web_host_name
  zone = var.default_zone # Этой строчки не было без неё виртуалка не создается т.к. она должна работать в зоне b - не дефолтная зона
  platform_id = var.vm_web_standart_platform_id # в4 нету у яндекса, максимум в3 и то нужно 2 ядра поставить а не одно https://cloud.yandex.ru/ru/docs/compute/concepts/performance-levels
  resources { 
    cores         = var.hardware_config_vms.vm_web.core
    memory        = var.hardware_config_vms.vm_web.memory
    core_fraction = var.hardware_config_vms.vm_web.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.ssh_key_for_any_host.serial-port-enable
    ssh-keys           = "ubuntu:${var.ssh_key_for_any_host.ssh-keys}"
  }
}



#Машина db
resource "yandex_compute_instance" "vms_platform" {
  name        = local.vm_db_host_name
  platform_id = var.vm_db_standart_platform_id # в4 нету у яндекса, максимум в3 и то нужно 2 ядра поставить а не одно https://cloud.yandex.ru/ru/docs/compute/concepts/performance-levels
  zone = var.vm_db_default_zone # Этой строчки не было
  resources { 
    cores         = var.hardware_config_vms.vm_db.core
    memory        = var.hardware_config_vms.vm_db.memory
    core_fraction = var.hardware_config_vms.vm_db.core_fraction
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.db_develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = var.ssh_key_for_any_host.serial-port-enable
    ssh-keys           = "ubuntu:${var.ssh_key_for_any_host.ssh-keys}"
  }
}
