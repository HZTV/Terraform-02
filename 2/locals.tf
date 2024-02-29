# Локальные переменные local.vm_web_host_name and local.vm_db_host_name
locals {
  vm_web_host_name = "${var.default_zone}-${var.vm_db_family_os}-${var.vm_web_platform_name}"
  vm_db_host_name = "${var.vm_web_family_os}-${var.vm_db_platform_name}-${var.vm_db_default_zone}"    
}