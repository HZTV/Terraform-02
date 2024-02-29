
output "data" {
    
    value = [ 
        {vm_web_fqdn = [yandex_compute_instance.platform.fqdn]},
        {vm_web_instance_name = [yandex_compute_instance.platform.name]},
        {vm_web_external_ip = [yandex_compute_instance.platform.network_interface[0].ip_address]},

        {vm_db_fqdn = [yandex_compute_instance.vms_platform.fqdn]},
        {vm_db_instance_name = [yandex_compute_instance.vms_platform.name]},
        {vm_db_external_ip = [yandex_compute_instance.vms_platform.network_interface[0].ip_address]}
    ] 
}
