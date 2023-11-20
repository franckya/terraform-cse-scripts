resource "azurerm_network_interface" "ojag_shrapp_nic" {
  name                = "ojag-shrapp-nic"
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.ojag_shrapp_subnet.id
    private_ip_address_allocation = "Static"
    private_ip_address            = "10.18.1.4"  # Example IP, change as needed
  }
}

resource "azurerm_windows_virtual_machine" "ojag_shrapp_vm" {
  name                = "ojag-shrapp-vm"
  resource_group_name = azurerm_resource_group.ojag_shrapp_rg.name
  location            = azurerm_resource_group.ojag_shrapp_rg.location
  size                = "Standard_D2s_v3"
  admin_username      = "myusername"
  admin_password      = "myuniquepassword"  # Replace with a secure method to generate passwords
  network_interface_ids = [
    azurerm_network_interface.ojag_shrapp_nic.id,
  ]

  computer_name = "ojag-server2019"
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Premium_LRS"
  }
  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }
}

