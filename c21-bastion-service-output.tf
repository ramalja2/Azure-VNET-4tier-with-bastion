# Bastion service subnet name
output "bastion_service_subnet_name" {
    description = "Bastion service subnet name"
    value = azurerm_subnet.bastion_service_subnet.name
}

output "bastion_service_subnet_id" {
    description = "Bastion service subnet address space"
    value = azurerm_subnet.bastion_service_subnet.id 
    }

## bastion service Public IP Address

output "bastion_service_public_ip" {
  description = "bastion service VM Public Address"
  value = azurerm_public_ip.bastion_service_public_ip.ip_address
}

# bastion VM Outputs

## Virtual Machine Public IP
output "bastion_service_host_public_ip_address" {
  description = "bastion host Virtual Machine Public IP"
  value = azurerm_bastion_host.bastion_service_host
}



