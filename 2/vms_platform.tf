# Выбор ОС
variable "vm_db_family_os" {
  type = string
  default = "ubuntu-2204-lts"
  description = "falimly os linux"
}

# Имя хоста
variable "vm_db_platform_name" {
  type = string
  default = "netology-develop-platform-db"
  description = "host name" 
}

# Выбор процессора
variable "vm_db_standart_platform_id" {
  type = string
  default = "standard-v1"
  description = "choosing a platform standard"
}

# OLD ssh.vars
# variable "vm_db_ssh_root_key" {
#   type        = string
#   default     = "ssh-rsa ***"
#   description = ""
# }



# Прерыдущая переменная для конфига железа vm_db
# variable "vm_db_config_cpu_mem_raction" {
#   type = map(string)
#   default = {
#     "core" = "2"
#     "memory" = "2"
#     "core_fraction" = "20"
#   }
# }


# Подсеть
variable "vm_db_default_cidr" {
  type        = list(string)
  default     = ["10.0.2.0/24"]
  description = "test"
}

# Имя сети
variable "vm_db_vpc_name" {
  type        = string
  default     = "db_develop"
  description = "VPC network & subnet name"
}

# Зона доступности
variable "vm_db_default_zone" {
  type        = string
  default     = "ru-central1-b"
  description = "ru-central1-b"
}
