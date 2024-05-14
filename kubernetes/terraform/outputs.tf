output "external_ip_address_app" {
  value = [for instance in yandex_compute_instance.reddit : instance.network_interface.0.nat_ip_address]
}
