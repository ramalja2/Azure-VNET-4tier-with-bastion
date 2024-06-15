# create variable for azure bastion service

variable "bastion_service_subnet_name" {
    description = "Bastion service subnet name"
    default = "AzureBastionSubnet"
}

variable "bastion_service_subnet_address" {
    description = "Bastion service subnet address space"
    default = [ "10.0.101.0/27" ] 
    }

#Create azure bastion service subnet
resource "azurerm_subnet" "bastion_service_subnet" {
    name = var.bastion_service_subnet_name
    resource_group_name = azurerm_resource_group.rg.name
    virtual_network_name = azurerm_virtual_network.vnet.name
    address_prefixes = var.bastion_service_subnet_address
}

# crate azure bastion service public IP
resource "azurerm_public_ip" "bastion_service_public_ip" {
  name = "${local.resource_name_prefix}-bastion-service-public-ip"
  resource_group_name = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
  allocation_method = "Static"
  sku = "Standard"
}

# create bastion service host
resource "azurerm_bastion_host" "bastion_service_host" {
    name = "${local.resource_name_prefix}-bastion-service-host"
    resource_group_name = azurerm_resource_group.rg.name
    location = azurerm_resource_group.rg.location
  ip_configuration {
    name = "configuration"
    subnet_id = azurerm_subnet.bastion_service_subnet.id
    public_ip_address_id = azurerm_public_ip.bastion_service_public_ip.id
  }
}