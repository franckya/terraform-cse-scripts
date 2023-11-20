resource "azurerm_virtual_network" "ojag_shrapp_vnet" {
  name                = "ojag-shrapp-vnet"
  address_space       = ["10.18.0.0/16"]
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name
}

resource "azurerm_subnet" "AzureBastionSubnet" {
  name                 = "AzureBastionSubnet"
  resource_group_name  = azurerm_resource_group.ojag_shrapp_rg.name
  virtual_network_name = azurerm_virtual_network.ojag_shrapp_vnet.name
  address_prefixes     = ["10.18.2.0/26"]
}

resource "azurerm_subnet" "ojag_shrapp_subnet" {
  name                 = "ojag-shrapp-subnet"
  resource_group_name  = azurerm_resource_group.ojag_shrapp_rg.name
  virtual_network_name = azurerm_virtual_network.ojag_shrapp_vnet.name
  address_prefixes     = ["10.18.1.0/24"]
}
