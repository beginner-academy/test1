resource "azurerm_resource_group" "rg_VM" {
  name     = "rg1_VM"
  location = "UK South"
}
#
##resource "azurerm_resource_group" "rg_2" {
##  name     = "rg2_SP"
##  location = "UK South"
##}

#resource "azurerm_virtual_network" "VM_VNET" {
#  name                = "VM_VNET"
#  location            = azurerm_resource_group.rg_VM.location
#  resource_group_name = azurerm_resource_group.rg_VM.name
#  address_space       = ["10.0.0.0/16"]
#  dns_servers         = ["10.0.0.4", "10.0.0.5"]
#
##  subnet {
##    name           = "VM_subnet1"
##    address_prefix = "10.0.1.0/24"
##  }
##
##  subnet {
##    name           = "VM_subnet2"
##    address_prefix = "10.0.2.0/24"
##    security_group = azurerm_network_security_group.VM_NSG.id
##  }
#
#  tags = {
#    environment = "Dev"
#  }
#}
#
#resource "azurerm_subnet" "VM_subnet1" {
#  name                 = "VM_subnet1"
#  resource_group_name  = azurerm_resource_group.rg_VM.name
#  virtual_network_name = azurerm_virtual_network.VM_VNET.name
#  address_prefixes     = ["10.0.1.0/24"]
#}
#
#

#
#resource "azurerm_network_security_group" "VM_NSG" {
#  name                = "VM_NSG"
#  location            = azurerm_resource_group.rg_VM.location
#  resource_group_name = azurerm_resource_group.rg_VM.name
#
#  security_rule {
#    name                       = "test123"
#    priority                   = 100
#    direction                  = "Inbound"
#    access                     = "Allow"
#    protocol                   = "Tcp"
#    source_port_range          = "*"
#    destination_port_range     = "*"
#    source_address_prefix      = "*"
#    destination_address_prefix = "*"
#  }
#}
#
#resource "azurerm_subnet_network_security_group_association" "security_group_association" {
#  subnet_id                 = azurerm_subnet.VM_subnet1.id
#  network_security_group_id = azurerm_network_security_group.VM_NSG.id
#}
#

#resource "azurerm_network_interface" "VM_nic" {
#  name                = "VM_nic"
#  location            = azurerm_resource_group.rg_VM.location
#  resource_group_name = azurerm_resource_group.rg_VM.name
#
#  ip_configuration {
#    name                          = "VM_nic_internal"
#    subnet_id                     = azurerm_subnet.VM_subnet1.id
#    private_ip_address_allocation = "Dynamic"
#    public_ip_address_id          = azurerm_public_ip.VM_PIP.id
#  }
#}
#
#resource "azurerm_public_ip" "VM_PIP" {
#  name                = "VM_PIP"
#  resource_group_name = azurerm_resource_group.rg_VM.name
#  location            = azurerm_resource_group.rg_VM.location
#  allocation_method   = "Static"
#
#  tags = {
#    environment = "Dev"
#  }
#}
#
#resource "azurerm_linux_virtual_machine" "VM_machine" {
#  name                = "VMmachine"
#  resource_group_name = azurerm_resource_group.rg_VM.name
#  location            = azurerm_resource_group.rg_VM.location
#  size                = "Standard_B1ls"
#  admin_username      = "adminuser"
#  network_interface_ids = [
#    azurerm_network_interface.VM_nic.id,
#  ]
#
#  admin_ssh_key {
#    username   = "adminuser"
#    public_key = file("~/.ssh/id_rsa.pub")
#  }
#
#  os_disk {
#    caching              = "ReadWrite"
#    storage_account_type = "Standard_LRS"
#  }
#
#  source_image_reference {
#    publisher = "Oracle"
#    offer     = "Oracle-Linux"
#    sku       = "ol84-lvm-gen2"
#    version   = "latest"
#  }
#}
