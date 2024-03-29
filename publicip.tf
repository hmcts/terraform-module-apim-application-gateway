
resource "azurerm_public_ip" "app_gw" {
  provider            = azurerm.hub
  count               = length(var.private_ip_address)
  name                = element(var.private_ip_address, count.index) == var.private_ip_address[0] ? "${var.project_name}-${var.usage_name}-appgw-${var.env}-pip" : "${var.project_name}-${var.usage_name}-appgw-${var.env}-pip-${count.index}"
  location            = var.location
  resource_group_name = var.vnet_rg
  sku                 = "Standard"
  allocation_method   = "Static"
  zones               = var.public_ip_enable_multiple_availability_zones == true ? ["1", "2", "3"] : []
  tags                = var.common_tags
}