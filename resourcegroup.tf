# Creates a resource group to contain all Azure resources
resource "azurerm_resource_group" "cabbage_rg" {
  name     = "rg-${var.environment_name}-${var.location}-001" # Name of the resource group
  location = var.location                                     # Azure region for deployment
}