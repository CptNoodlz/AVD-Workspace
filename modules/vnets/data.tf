data "azurerm_resource_group" "Rg" {
  name = var.resource_group_name
}

data "azapi_resource" "customlocation" {
  type      = "microsoft.extendedlocation/customLocations@2021-08-15"
  name      = var.custom_location_name
  parent_id = data.azurerm_resource_group.rg.id
}
