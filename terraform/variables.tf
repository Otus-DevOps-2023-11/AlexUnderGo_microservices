variable "cloud_id" {
  description = "Cloud"
}

variable "folder_id" {
  description = "Folder"
}

variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}

variable "image_id" {
  description = "Image"
}

variable "subnet_id" {
  description = "Subnet"
}

variable "type" {
  description = "Disk Type"
}

variable "size" {
  description = "Disk size"
}

variable "platform_id" {
  description = "Platform"
}

variable "service_account_key_file" {
  description = "key .json"
}

variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

#variable "token" {
#  description = "oauth token"
#}
