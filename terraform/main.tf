provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "example" {
  name     = "eightpointtwoo-rg"
  location = "East US"
}

resource "azurerm_container_registry" "example" {
  name                = "eightpointtwoo"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  sku                 = "Basic"
  admin_enabled       = true
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "eightpointtwoo"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "eightpointtwoo"

  agent_pool_profile {
    name            = "agentpool"
    count           = 2
    vm_size        = "Standard_DS2_v2"
    os_type        = "Linux"
  }

  identity {
    type = "SystemAssigned"
  }

  role_based_access_control {
    enabled = true
  }

  default_node_pool {
    name            = "default"
    node_count      = 1
    vm_size         = "Standard_DS2_v2"
    os_type         = "Linux"
  }
}

resource "azurerm_postgresql_server" "example" {
  name                = "librarypostgres"
  resource_group_name = azurerm_resource_group.example.name
  location            = azurerm_resource_group.example.location
  version             = "11"
  administrator_login = "postgres"
  administrator_login_password = "password1234"
  sku {
    name     = "B_Gen5_1"
    tier     = "Basic"
    capacity = 1
  }
}

resource "azurerm_postgresql_database" "example" {
  name                = "library_db"
  resource_group_name = azurerm_resource_group.example.name
  server_name         = azurerm_postgresql_server.example.name
  charset             = "UTF8"
  collation           = "English_United States.1252"
}
