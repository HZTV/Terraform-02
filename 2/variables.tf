###cloud vars
variable "token" {
  type        = string
  description = "***"
}

variable "cloud_id" {
  type        = string
  description = "***"
}

variable "folder_id" {
  type        = string
  default = "***"
  description = "my_folder_id"
}

variable "default_zone" {
  type        = string
  default     = "ru-central1-a"
  description = "default_a"
}

variable "vm_web_default_cidr" {
  type        = list(string)
  default     = ["10.0.1.0/24"]
  description = "test"
}

variable "vm_web_vpc_name" {
  type        = string
  default     = "develop"
  description = "VPC network & subnet name"
}


###ssh vars
# OLD ssh.vars
# variable "vm_web_ssh_root_key" {
#   type        = string
#   default     = "ssh-rsa ***= root@mng"
#   description = ""
# }


# var task 2 
variable "vm_web_family_os" {
  type = string
  default = "ubuntu-2204-lts"
  description = "falimly os linux"
}

variable "vm_web_platform_name" {
  type = string
  default = "netology-develop-platform-web"
  description = "host name" 
}

variable "vm_web_standart_platform_id" {
  type = string
  default = "standard-v1"
  description = "choosing a platform standard"
}

# Прерыдущая переменная для конфига железа vm_web
# variable "vm_web_config_cpu_mem_raction" {
#   type = map(string)
#   default = {
#     "core" = "2"
#     "memory" = "1"
#     "core_fraction" = "5"
#   }
# }

 
  
# Объеденить все параметры железа в одной переменной
variable "hardware_config_vms" {
  type = map(object({
    core = number
    memory  = number
    core_fraction = number
  }))
  default = {
    "vm_web" = {
        core = 2
        memory  = 1
        core_fraction = 5
    }
    "vm_db" = {
          core = 2
          memory  = 2
          core_fraction = 20
    }
  }
}

# SSH key for web and db
variable "ssh_key_for_any_host" {
  type = map(string)
    default = {
        serial-port-enable = 1
        ssh-keys           = "ssh-rsa ***"
      }
    } 

