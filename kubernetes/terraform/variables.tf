variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}
variable "image_id" {
  description = "Disk image"
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
variable "reddit_count" {
  description = "Number of reddit base instances"
  default     = 2
}
variable "disc_count" {
  description = "Number of reddit discs"
  default     = 2
}
variable "service_account_key_file" {
  description = "key .json"
}
variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
