provider "azurerm" {
  features {}
  subscription_id = "e3231a6e-57d7-4fd6-9d16-bc2237d18c98"
}

# Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "BasicInfraRG"
  location = "West Europe"
}

# Virtual Network
resource "azurerm_virtual_network" "vnet" {
  name                = "BasicVNet"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  address_space       = ["10.0.0.0/16"]
}

# Subnets
resource "azurerm_subnet" "default" {
  name                 = "default"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.0.0/24"]
}

resource "azurerm_subnet" "basic" {
  name                 = "BasicSubnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = ["10.0.1.0/24"]
}

# Public IP
resource "azurerm_public_ip" "public_ip" {
  name                = "UbuntuVM-PublicIP"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  allocation_method   = "Static"  # Alterado para Static
  sku                 = "Standard"  # Mantido como Standard
}

# Network Interface
resource "azurerm_network_interface" "nic" {
  name                = "UbuntuVM-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.default.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public_ip.id
  }
}

# Virtual Machine
resource "azurerm_virtual_machine" "vm" {
  name                  = "UbuntuVM"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = "Standard_B1s"

  # OS Disk
  storage_os_disk {
    name              = "UbuntuOSDisk"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }

  # OS Image
  storage_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-focal"
    sku       = "20_04-lts-gen2"
    version   = "latest"
  }

  # OS Profile
  os_profile {
    computer_name  = "UbuntuVM"
    admin_username = "azureadmin"
    admin_password = "P@ssw0rd12345"
  }
  # Linux Configuration
  os_profile_linux_config {
    disable_password_authentication = false
  }
}
