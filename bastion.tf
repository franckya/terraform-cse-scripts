resource "azurerm_public_ip" "ojag_shrapp_bastion_ip" {
  name                = "ojag-shrapp-bastion-ip"
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name
  allocation_method   = "Static"
  sku                 = "Standard"
}

resource "azurerm_bastion_host" "ojag_shrapp_bastion_host" {
  name                = "ojag-shrapp-bastion"
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name
  ip_configuration {
    name                 = "configuration"
    subnet_id            = azurerm_subnet.AzureBastionSubnet.id
    public_ip_address_id = azurerm_public_ip.ojag_shrapp_bastion_ip.id
  }
}
