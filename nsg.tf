resource "azurerm_network_security_group" "ojag_shrapp_nsg" {
  name                = "ojag-shrapp-nsg"
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name
}

resource "azurerm_network_security_rule" "allow_rdp_from_bastion" {
  name                        = "AllowRDPFromBastion"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "10.18.2.0/26"
  destination_address_prefix  = "10.18.1.0/24"
  resource_group_name         = azurerm_resource_group.ojag_shrapp_rg.name
  network_security_group_name = azurerm_network_security_group.ojag_shrapp_nsg.name
}
