resource "azurerm_resource_group" "backend_rg" {
  name     = "ojag-backend-rg"
  location = "East US"
}

resource "azurerm_storage_account" "backend_sa" {
  name                     = "ojagstorageaccount"
  resource_group_name      = azurerm_resource_group.backend_rg.name
  location                 = azurerm_resource_group.backend_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "backend_container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.backend_sa.name
  container_access_type = "private"
}
