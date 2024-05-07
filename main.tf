resource "azurerm_resource_group" "res_group" {
  location = "eastasia"
  name     = "oms-qas-ea"
  #tags = {
  #  "Cost Center" = "DURBELL"
  #}
}
resource "azurerm_network_security_group" "nsg_data" {
  location            = "eastasia"
  name                = "nsg-durbell-oms-data-qas-ea"
  resource_group_name = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}
resource "azurerm_network_security_rule" "nsg_rule_data_1" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_ranges     = ["8080", "8181"]
  direction                   = "Inbound"
  name                        = "AllowAnyCustom8080_8181Inbound"
  network_security_group_name = "nsg-durbell-oms-data-qas-ea"
  priority                    = 140
  protocol                    = "*"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_data,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_data_2" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPOutbound"
  network_security_group_name = "nsg-durbell-oms-data-qas-ea"
  priority                    = 120
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_data,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_data_3" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "AllowAnyHTTPSInbound"
  network_security_group_name = "nsg-durbell-oms-data-qas-ea"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_data,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_data_4" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPSOutbound"
  network_security_group_name = "nsg-durbell-oms-data-qas-ea"
  priority                    = 110
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_data,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_data_5" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "1433"
  direction                   = "Outbound"
  name                        = "AllowAnyMS_SQLOutbound"
  network_security_group_name = "nsg-durbell-oms-data-qas-ea"
  priority                    = 130
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_data,
  ]
}
resource "azurerm_network_security_group" "nsg_integration" {
  location            = "eastasia"
  name                = "nsg-durbell-oms-intregration-qas-ea"
  resource_group_name = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}
resource "azurerm_network_security_rule" "nsg_rule_integration_1" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPOutbound"
  network_security_group_name = "nsg-durbell-oms-intregration-qas-ea"
  priority                    = 110
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_integration,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_integration_2" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "AllowAnyHTTPSInbound"
  network_security_group_name = "nsg-durbell-oms-intregration-qas-ea"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_integration,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_integration_3" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPSOutbound"
  network_security_group_name = "nsg-durbell-oms-intregration-qas-ea"
  priority                    = 120
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_integration,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_integration_4" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "1433"
  direction                   = "Outbound"
  name                        = "AllowAnyMS_SQLOutbound"
  network_security_group_name = "nsg-durbell-oms-intregration-qas-ea"
  priority                    = 130
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_integration,
  ]
}
resource "azurerm_network_security_group" "nsg_private" {
  location            = "eastasia"
  name                = "nsg-durbell-oms-private-qas-ea"
  resource_group_name = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}
resource "azurerm_network_security_rule" "nsg_rule_private_1" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "65200-65535"
  direction                   = "Inbound"
  name                        = "AllowAnyCustom65200-65535Inbound"
  network_security_group_name = "nsg-durbell-oms-private-qas-ea"
  priority                    = 140
  protocol                    = "*"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_private,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_private_2" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPOutbound"
  network_security_group_name = "nsg-durbell-oms-private-qas-ea"
  priority                    = 110
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_private,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_private_3" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "AllowAnyHTTPSInbound"
  network_security_group_name = "nsg-durbell-oms-private-qas-ea"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_private,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_private_4" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPSOutbound"
  network_security_group_name = "nsg-durbell-oms-private-qas-ea"
  priority                    = 120
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_private,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_private_5" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "1433"
  direction                   = "Outbound"
  name                        = "AllowAnyMS_SQLOutbound"
  network_security_group_name = "nsg-durbell-oms-private-qas-ea"
  priority                    = 130
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_private,
  ]
}
resource "azurerm_network_security_group" "nsg_public" {
  location            = "eastasia"
  name                = "nsg-durbell-oms-public-qas-ea"
  resource_group_name = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}
resource "azurerm_network_security_rule" "nsg_rule_public_1" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "65200-65535"
  direction                   = "Inbound"
  name                        = "AllowAnyCustom65200-65535Inbound"
  network_security_group_name = "nsg-durbell-oms-public-qas-ea"
  priority                    = 140
  protocol                    = "*"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_public,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_public_2" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "80"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPOutbound"
  network_security_group_name = "nsg-durbell-oms-public-qas-ea"
  priority                    = 110
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_public,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_public_3" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Inbound"
  name                        = "AllowAnyHTTPSInbound"
  network_security_group_name = "nsg-durbell-oms-public-qas-ea"
  priority                    = 100
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_public,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_public_4" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "443"
  direction                   = "Outbound"
  name                        = "AllowAnyHTTPSOutbound"
  network_security_group_name = "nsg-durbell-oms-public-qas-ea"
  priority                    = 120
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_public,
  ]
}
resource "azurerm_network_security_rule" "nsg_rule_public_5" {
  access                      = "Allow"
  destination_address_prefix  = "*"
  destination_port_range      = "1433"
  direction                   = "Outbound"
  name                        = "AllowAnyMS_SQLOutbound"
  network_security_group_name = "nsg-durbell-oms-public-qas-ea"
  priority                    = 130
  protocol                    = "Tcp"
  resource_group_name         = "oms-qas-ea"
  source_address_prefix       = "*"
  source_port_range           = "*"
  depends_on = [
    azurerm_network_security_group.nsg_public,
  ]
}

/*
resource "azurerm_private_endpoint" "res-24" {
  location            = "eastasia"
  name                = "pe-oms-connect-qas-sea-01"
  resource_group_name = "oms-qas"
  subnet_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  private_service_connection {
    is_manual_connection           = false
    name                           = "pe-oms-connect-qas-sea-01-913e"
    private_connection_resource_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/sites/oms-connect-qas"
    subresource_names              = ["sites"]
  }
  depends_on = [
    azurerm_windows_web_app.res-130,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_network_security_group_association.nsg_asso_public,azurerm_subnet_route_table_association.rt_asso_public (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_private_endpoint" "res-25" {
  location            = "eastasia"
  name                = "pe-oms-report-qas.durbell.com"
  resource_group_name = "oms-qas"
  subnet_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  private_service_connection {
    is_manual_connection           = false
    name                           = "pe-oms-report-qas.durbell.com-9906"
    private_connection_resource_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/sites/salestools-report-oms-qas"
    subresource_names              = ["sites"]
  }
  depends_on = [
    azurerm_windows_web_app.res-376,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_network_security_group_association.nsg_asso_public,azurerm_subnet_route_table_association.rt_asso_public (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_private_endpoint" "res-26" {
  location            = "eastasia"
  name                = "pe-salestools-web-oms-qas-sea-01"
  resource_group_name = "oms-qas"
  subnet_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  private_service_connection {
    is_manual_connection           = false
    name                           = "pe-salestools-web-oms-qas-sea-01-8a7c"
    private_connection_resource_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/sites/salestools-web-oms-qas"
    subresource_names              = ["sites"]
  }
  depends_on = [
    azurerm_windows_web_app.res-619,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_network_security_group_association.nsg_asso_public,azurerm_subnet_route_table_association.rt_asso_public (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_private_endpoint" "res-27" {
  location            = "eastasia"
  name                = "pe-services-salestools-oms-qas-sea-01"
  resource_group_name = "oms-qas"
  subnet_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  private_service_connection {
    is_manual_connection           = false
    name                           = "pe-services-salestools-oms-qas-sea-01-95aa"
    private_connection_resource_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/sites/services-salestools-oms-qas"
    subresource_names              = ["sites"]
  }
  depends_on = [
    azurerm_windows_web_app.res-865,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_network_security_group_association.nsg_asso_public,azurerm_subnet_route_table_association.rt_asso_public (can't auto-resolve as their ids are identical)
  ]
}*/

resource "azurerm_route_table" "rt_oms_qas" {
  location            = "eastasia"
  name                = "rt-durbell-oms-qas-ea"
  resource_group_name = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}
resource "azurerm_route" "route_oms_qas" {
  address_prefix         = "0.0.0.0/0"
  name                   = "RouteToFW"
  next_hop_in_ip_address = "10.254.0.132"
  next_hop_type          = "VirtualAppliance"
  resource_group_name    = "oms-qas-ea"
  route_table_name       = "rt-durbell-oms-qas-ea"
  depends_on = [
    azurerm_route_table.rt_oms_qas,
  ]
}
resource "azurerm_virtual_network" "vnet_oms_qas" {
  address_space       = ["10.240.30.0/26"] #["10.240.26.0/26"]
  location            = "eastasia"
  name                = "vnet-durbll-oms-qas-ea-01"
  resource_group_name = "oms-qas-ea"
  depends_on = [
    azurerm_resource_group.res_group,
  ]
}
resource "azurerm_subnet" "subnet_data" {
  address_prefixes     = ["10.240.30.48/28"] #["10.240.26.48/28"]
  name                 = "DataSubnet"
  resource_group_name  = "oms-qas-ea" 
  virtual_network_name = "vnet-durbll-oms-qas-ea-01"
  depends_on = [
    azurerm_virtual_network.vnet_oms_qas,
  ]
}
resource "azurerm_subnet_network_security_group_association" "nsg_asso_data" {
  network_security_group_id = azurerm_network_security_group.nsg_data.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/networkSecurityGroups/nsg-durbell-oms-data-qas-ea"
  subnet_id                 = azurerm_subnet.subnet_data.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-ea-01/subnets/DataSubnet"
  depends_on = [
    azurerm_network_security_group.nsg_data,
    # One of azurerm_subnet.subnet_data,azurerm_subnet_route_table_association.rt_asso_data (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet_route_table_association" "rt_asso_data" {
  route_table_id = azurerm_route_table.rt_oms_qas.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/routeTables/rt-durbell-oms-qas"
  subnet_id      = azurerm_subnet.subnet_data.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/DataSubnet"
  depends_on = [
    azurerm_route_table.rt_oms_qas,
    # One of azurerm_subnet.subnet_data,azurerm_subnet_network_security_group_association.nsg_asso_data (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet" "subnet_integration" {
  address_prefixes     = ["10.240.30.32/28"] #["10.240.26.32/28"]
  name                 = "IntregrationSubnet"
  resource_group_name  = "oms-qas-ea"
  virtual_network_name = "vnet-durbll-oms-qas-ea-01"
  delegation {
    name = "delegation"
    service_delegation {
      actions = ["Microsoft.Network/virtualNetworks/subnets/action"]
      name    = "Microsoft.Web/serverFarms"
    }
  }
  depends_on = [
    azurerm_virtual_network.vnet_oms_qas,
  ]
}
resource "azurerm_subnet_network_security_group_association" "nsg_asso_integration" {
  network_security_group_id = azurerm_network_security_group.nsg_integration.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/networkSecurityGroups/nsg-durbell-oms-intregration-qas"
  subnet_id                 = azurerm_subnet.subnet_integration.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  depends_on = [
    azurerm_network_security_group.nsg_integration,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_route_table_association.rt_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet_route_table_association" "rt_asso_integration" {
  route_table_id = azurerm_route_table.rt_oms_qas.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/routeTables/rt-durbell-oms-qas"
  subnet_id      = azurerm_subnet.subnet_integration.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  depends_on = [
    azurerm_route_table.rt_oms_qas,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_network_security_group_association.nsg_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet" "subnet_private" {
  address_prefixes     = ["10.240.30.16/28"] #["10.240.26.16/28"]
  name                 = "PrivateSubnet"
  resource_group_name  = "oms-qas-ea"
  virtual_network_name = "vnet-durbll-oms-qas-ea-01"
  depends_on = [
    azurerm_virtual_network.vnet_oms_qas,
  ]
}
resource "azurerm_subnet_network_security_group_association" "nsg_asso_private" {
  network_security_group_id = azurerm_network_security_group.nsg_private.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/networkSecurityGroups/nsg-durbell-oms-private-qas"
  subnet_id                 = azurerm_subnet.subnet_private.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PrivateSubnet"
  depends_on = [
    azurerm_network_security_group.nsg_private,
    # One of azurerm_subnet.subnet_private,azurerm_subnet_route_table_association.rt_asso_private (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet_route_table_association" "rt_asso_private" {
  route_table_id = azurerm_route_table.rt_oms_qas.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/routeTables/rt-durbell-oms-qas"
  subnet_id      = azurerm_subnet.subnet_private.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PrivateSubnet"
  depends_on = [
    azurerm_route_table.rt_oms_qas,
    # One of azurerm_subnet.subnet_private,azurerm_subnet_network_security_group_association.nsg_asso_private (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet" "subnet_public" {
  address_prefixes     = ["10.240.30.0/28"] #["10.240.26.0/28"]
  name                 = "PublicSubnet"
  resource_group_name  = "oms-qas-ea"
  virtual_network_name = "vnet-durbll-oms-qas-ea-01"
  depends_on = [
    azurerm_virtual_network.vnet_oms_qas,
  ]
}
resource "azurerm_subnet_network_security_group_association" "nsg_asso_public" {
  network_security_group_id = azurerm_network_security_group.nsg_public.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/networkSecurityGroups/nsg-durbell-oms-public-qas"
  subnet_id                 = azurerm_subnet.subnet_public.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  depends_on = [
    azurerm_network_security_group.nsg_public,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_route_table_association.rt_asso_public (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_subnet_route_table_association" "rt_asso_public" {
  route_table_id = azurerm_route_table.rt_oms_qas.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/routeTables/rt-durbell-oms-qas"
  subnet_id      = azurerm_subnet.subnet_public.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/PublicSubnet"
  depends_on = [
    azurerm_route_table.rt_oms_qas,
    # One of azurerm_subnet.subnet_public,azurerm_subnet_network_security_group_association.nsg_asso_public (can't auto-resolve as their ids are identical)
  ]
}

/* #>>>>>>>>>>>>>>>>
resource "azurerm_virtual_network_peering" "peer_vnet_oms_qas" {
  allow_forwarded_traffic   = true
  name                      = "peer-omsQas-ea-to-hub"
  remote_virtual_network_id = "/subscriptions/f649a4df-64c4-46bd-a27f-fe0351b161a1/resourceGroups/rg-tcp-hub-prod-sea-01/providers/Microsoft.Network/virtualNetworks/vnet-tcp-hub-prod-sea-01"
  resource_group_name       = "oms-qas-ea"
  use_remote_gateways       = true
  virtual_network_name      = "vnet-durbll-oms-qas-ea-01"
  depends_on = [
    azurerm_virtual_network.vnet_oms_qas,
  ]
}*/ #>>>>>>>>>>>>>>>>

resource "azurerm_mssql_server" "sql_server" {
  administrator_login = "omsadminqasea"
  administrator_login_password = "P@$$w0rd1234!"
  location            = "eastasia"
  minimum_tls_version = "1.0"
  name                = "sql-oms-qas-ea"
  resource_group_name = "oms-qas-ea"
  version             = "12.0"
  azuread_administrator {
    login_username = "Natthakrit Chaipakkasem" #"Siripong Tachapharungruk"
    object_id      = "cdd64d0c-47aa-445c-ab80-5f6e71218c21" #"763d58aa-1ce0-47d8-af23-92516319f135"
  }
  identity {
    type = "SystemAssigned"
  }
  depends_on = [ azurerm_resource_group.res_group ]
}
/* #>>>>>>>>>>>>>>>>
resource "azurerm_sql_active_directory_administrator" "sql_authen" {
  login               = "Siripong Tachapharungruk"
  object_id           = "763d58aa-1ce0-47d8-af23-92516319f135"
  resource_group_name = "oms-qas-ea"
  server_name         = "sql-oms-qas-ea"
  tenant_id           = "9274fc4b-71e6-4ef9-8ef7-aa70decd0605"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}*/ #>>>>>>>>>>>>>>>

/*
resource "azurerm_mssql_database" "res-56" {
  name      = "ST_DBOMS_QAS"
  server_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-67" {
  database_id            = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas/databases/ST_DBOMS_QAS"
  enabled                = false
  log_monitoring_enabled = false
  depends_on = [
    azurerm_mssql_database.res-56,
  ]
}
resource "azurerm_mssql_database_extended_auditing_policy" "res-76" {
  database_id            = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas/databases/master"
  enabled                = false
  log_monitoring_enabled = false
}
*/

 /* #>>>>>>>>>>>>>
 data azurerm_client_config "current" {  
 }
 #>>>>>>>>>>>>>

resource "azurerm_mssql_server_microsoft_support_auditing_policy" "sql_ms_support_audit_p" {
  enabled                = false
  log_monitoring_enabled = false
  server_id              = azurerm_mssql_server.sql_server.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}
resource "azurerm_mssql_server_transparent_data_encryption" "sql_tran_data_encryp" {
  server_id = azurerm_mssql_server.sql_server.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}
 #>>>>>>>>>>>>>
resource "azurerm_mssql_server_extended_auditing_policy" "sql_exten_audit_p" { ### this statement error
  log_monitoring_enabled          = false
  server_id                       = azurerm_mssql_server.sql_server.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  storage_account_subscription_id = data.azurerm_client_config.current.subscription_id #"0d527404-a2aa-4a85-abdb-a96d11ba8186" #"000622a4-e7c4-4fb5-8481-aec97b7970e7"
  storage_endpoint                = azurerm_storage_account.st_auditlog.primary_blob_endpoint #"https://omsqaseaauditlog.blob.core.windows.net/" #"https://omsauditlog.blob.core.windows.net/"
  depends_on = [
    azurerm_storage_account.st_auditlog, azurerm_mssql_server.sql_server
  ]
} #>>>>>>>>>>>>>

 #>>>>>>>>>>>>>>>>>>
######################################################################################
######################################################################################
data azurerm_storage_account "st_labnc"{
  resource_group_name = "rg-labnc-devops"
  name = "stlabncbackup"
}
resource "azurerm_role_assignment" "audit_contributor" {
  scope                = data.azurerm_storage_account.st_labnc.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.sql_server.identity[0].principal_id
}
resource "azurerm_role_assignment" "staudit_contributor" {
  scope                = azurerm_storage_account.st_auditlog.id
  role_definition_name = "Storage Blob Data Contributor"
  principal_id         = azurerm_mssql_server.sql_server.identity[0].principal_id
}*/
######################################################################################
######################################################################################
 #>>>>>>>>>>>>>>>>>>

resource "azurerm_mssql_firewall_rule" "sql_fw_rule_1" {
  end_ip_address   = "0.0.0.0"
  name             = "AllowAllWindowsAzureIps"
  server_id        = azurerm_mssql_server.sql_server.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  start_ip_address = "0.0.0.0"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}
resource "azurerm_mssql_firewall_rule" "sql_fw_rule_2" {
  end_ip_address   = "255.255.255.255"
  name             = "allow all"
  server_id        = azurerm_mssql_server.sql_server.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas"
  start_ip_address = "0.0.0.0"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}

/*
resource "azurerm_mssql_server_security_alert_policy" "sql_sec_alert_p" {
  resource_group_name = "oms-qas-ea"
  server_name         = "sql-oms-qas-ea"
  state               = "Enabled"
  depends_on = [
    azurerm_mssql_server.sql_server,
  ]
}
resource "azurerm_mssql_server_vulnerability_assessment" "sql_vulner_assess" {
  server_security_alert_policy_id = azurerm_mssql_server_security_alert_policy.sql_sec_alert_p.id #"/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Sql/servers/sql-oms-qas/securityAlertPolicies/Default"
  storage_container_path          = "https://stlabncbackup.blob.core.windows.net/vulnerability-assessment" #"https://sqlvatzeb4vnykh4ga.blob.core.windows.net/vulnerability-assessment/"
  ############
  recurring_scans {
    enabled = true
  }
  ############
  depends_on = [
    azurerm_mssql_server_security_alert_policy.sql_sec_alert_p,
  ]
}
 */
/*
resource "azurerm_storage_account" "st_auditlog" {
  account_kind             = "Storage"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  location                 = "eastasia"
  name                     = "omsqaseaauditlog"
  resource_group_name      = "oms-qas-ea"
  depends_on = [ azurerm_resource_group.res_group ]
}


resource "azurerm_storage_container" "st_con_auditlog" {
  name                 = "sqldbauditlogs"
  storage_account_name = "omsqaseaauditlog"
}

resource "azurerm_storage_account" "res-97" {
  account_replication_type        = "LRS"
  account_tier                    = "Standard"
  allow_nested_items_to_be_public = false
  location                        = "eastasia"
  name                            = "sqlvatzeb4vnykh4ga"
  resource_group_name             = "oms-qas"
}
resource "azurerm_storage_container" "res-99" {
  name                 = "vulnerability-assessment"
  storage_account_name = "sqlvatzeb4vnykh4ga"
}
resource "azurerm_storage_account" "res-103" {
  account_replication_type = "RAGRS"
  account_tier             = "Standard"
  location                 = "eastasia"
  min_tls_version          = "TLS1_0"
  name                     = "storageomsqastest"
  resource_group_name      = "oms-qas"
}
resource "azurerm_storage_container" "res-105" {
  name                 = "app"
  storage_account_name = "storageomsqastest"
}
resource "azurerm_storage_container" "res-106" {
  container_access_type = "blob"
  name                  = "database"
  storage_account_name  = "storageomsqastest"
}
resource "azurerm_storage_container" "res-107" {
  container_access_type = "blob"
  name                  = "interface"
  storage_account_name  = "storageomsqastest"
}
resource "azurerm_storage_container" "res-108" {
  container_access_type = "blob"
  name                  = "pictures"
  storage_account_name  = "storageomsqastest"
}
resource "azurerm_storage_account" "res-112" {
  account_replication_type = "RAGRS"
  account_tier             = "Standard"
  location                 = "eastasia"
  min_tls_version          = "TLS1_0"
  name                     = "stroageomsqas"
  resource_group_name      = "oms-qas"
}
resource "azurerm_storage_container" "res-114" {
  name                 = "appservicelogs"
  storage_account_name = "stroageomsqas"
}
resource "azurerm_storage_container" "res-115" {
  container_access_type = "blob"
  name                  = "databackup"
  storage_account_name  = "stroageomsqas"
}
resource "azurerm_storage_container" "res-116" {
  container_access_type = "blob"
  name                  = "interface"
  storage_account_name  = "stroageomsqas"
}
resource "azurerm_storage_container" "res-117" {
  container_access_type = "blob"
  name                  = "pictures"
  storage_account_name  = "stroageomsqas"
}
resource "azurerm_storage_container" "res-118" {
  name                 = "thaipost"
  storage_account_name = "stroageomsqas"
}
resource "azurerm_storage_container" "res-119" {
  name                 = "webserverlogs"
  storage_account_name = "stroageomsqas"
}*/
/*
resource "azurerm_app_service_certificate" "res-123" {
  location            = "eastasia"
  name                = "durbellW1-Durbell23"
  resource_group_name = "oms-qas"
}
resource "azurerm_app_service_certificate" "res-124" {
  location            = "eastasia"
  name                = "durbellW1-Durbell24"
  resource_group_name = "oms-qas"
}
resource "azurerm_app_service_certificate" "res-125" {
  location            = "eastasia"
  name                = "oms-connect-qas.durbell.com-oms-connect-qas-undefined"
  resource_group_name = "oms-qas"
}
resource "azurerm_app_service_certificate" "res-126" {
  location            = "eastasia"
  name                = "oms-qas.durbell.com-salestools-web-oms-qas-undefined"
  resource_group_name = "oms-qas"
}
resource "azurerm_app_service_certificate" "res-127" {
  location            = "eastasia"
  name                = "oms-report-qas.durbell.com-salestools-report-oms-qas-undefined"
  resource_group_name = "oms-qas"
}
resource "azurerm_app_service_certificate" "res-128" {
  location            = "eastasia"
  name                = "oms-services-qas.durbell.com-services-salestools-oms-qas-undefined"
  resource_group_name = "oms-qas"
}*/

resource "azurerm_service_plan" "asp_oms_qas" {
  location            = "eastasia"
  name                = "plan-oms-qas-ea"
  os_type             = "Windows"
  resource_group_name = "oms-qas-ea"
  sku_name            = "P1v2"
  depends_on = [ azurerm_resource_group.res_group ]
}

/*
resource "azurerm_windows_web_app" "res-130" {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "3d83bd8d-768f-4a25-9974-074a28053bef"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=3d83bd8d-768f-4a25-9974-074a28053bef;IngestionEndpoint=https://eastasia-1.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    WEBSITE_TIME_ZONE                          = "SE Asia Standard Time"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled   = true
  location                  = "eastasia"
  name                      = "oms-connect-qas"
  resource_group_name       = "oms-qas"
  service_plan_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/serverfarms/plan-oms-qas"
  virtual_network_subnet_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  site_config {
    ftps_state              = "FtpsOnly"
    scm_minimum_tls_version = "1.0"
    use_32_bit_worker       = false
    vnet_route_all_enabled  = true
    ip_restriction {
      ip_address = "122.155.162.24/24"
      priority   = 1000
    }
    ip_restriction {
      ip_address = "40.65.191.69/24"
      priority   = 1001
    }
    ip_restriction {
      ip_address = "23.97.61.221/24"
      priority   = 800
    }
  }
  sticky_settings {
    app_setting_names = ["WEBSITE_TIME_ZONE"]
  }
  depends_on = [
    azurerm_service_plan.asp_oms_qas,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_network_security_group_association.nsg_asso_integration,azurerm_subnet_route_table_association.rt_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-137" {
  app_service_name    = "oms-connect-qas"
  hostname            = "oms-connect-qas.azurewebsites.net"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-130,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-138" {
  app_service_name    = "oms-connect-qas"
  hostname            = "oms-connect-qas.durbell.com"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-130,
  ]
}
resource "azurerm_windows_web_app" "res-376" {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "3fa20979-73fa-4894-a76d-960767c668a2"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=3fa20979-73fa-4894-a76d-960767c668a2;IngestionEndpoint=https://eastasia-1.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    WEBSITE_TIME_ZONE                          = "SE Asia Standard Time"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled   = true
  https_only                = true
  location                  = "eastasia"
  name                      = "salestools-report-oms-qas"
  resource_group_name       = "oms-qas"
  service_plan_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/serverfarms/plan-oms-qas"
  virtual_network_subnet_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  logs {
    http_logs {
      azure_blob_storage {
        retention_in_days = 30
        sas_url           = "https://stroageomsqas.blob.core.windows.net/webserverlogs?sp=rwdl&st=2021-11-15T07:42:52Z&se=2221-11-15T07:42:52Z&sv=2020-08-04&sr=c&sig=HD0kVtB1Wnlrg1vzT%2BCq%2FccLqIg4rwwYfodwyqLVSQE%3D"
      }
    }
  }
  site_config {
    ftps_state              = "FtpsOnly"
    scm_minimum_tls_version = "1.0"
    vnet_route_all_enabled  = true
    ip_restriction {
      ip_address = "122.155.162.24/24"
      priority   = 1000
    }
    ip_restriction {
      ip_address = "40.65.191.69/24"
      priority   = 1001
    }
    ip_restriction {
      ip_address = "23.97.61.221/24"
      priority   = 800
    }
  }
  sticky_settings {
    app_setting_names = ["WEBSITE_TIME_ZONE"]
  }
  depends_on = [
    azurerm_service_plan.asp_oms_qas,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_network_security_group_association.nsg_asso_integration,azurerm_subnet_route_table_association.rt_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-380" {
  app_service_name    = "salestools-report-oms-qas"
  hostname            = "oms-report-qas.durbell.com"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-376,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-381" {
  app_service_name    = "salestools-report-oms-qas"
  hostname            = "salestools-report-oms-qas.azurewebsites.net"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-376,
  ]
}
resource "azurerm_windows_web_app" "res-619" {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "8ecd26c1-0152-4348-a965-f49e72c28677"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=8ecd26c1-0152-4348-a965-f49e72c28677;IngestionEndpoint=https://eastasia-1.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    WEBSITE_TIME_ZONE                          = "SE Asia Standard Time"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled   = true
  https_only                = true
  location                  = "eastasia"
  name                      = "salestools-web-oms-qas"
  resource_group_name       = "oms-qas"
  service_plan_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/serverfarms/plan-oms-qas"
  virtual_network_subnet_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  logs {
    http_logs {
      azure_blob_storage {
        retention_in_days = 30
        sas_url           = "https://stroageomsqas.blob.core.windows.net/webserverlogs?sp=rwdl&st=2021-11-15T07:44:03Z&se=2221-11-15T07:44:03Z&sv=2020-08-04&sr=c&sig=SNlt7ouM8dEJZu%2FC5EwBbQKO8CzZE1VYhJjXPlLwFMI%3D"
      }
    }
  }
  site_config {
    ftps_state              = "FtpsOnly"
    scm_minimum_tls_version = "1.0"
    use_32_bit_worker       = false
    vnet_route_all_enabled  = true
    ip_restriction {
      ip_address = "122.155.162.24/24"
      priority   = 1000
    }
    ip_restriction {
      ip_address = "40.65.191.69/24"
      priority   = 1001
    }
    ip_restriction {
      ip_address = "23.97.61.221/24"
      priority   = 800
    }
  }
  sticky_settings {
    app_setting_names = ["WEBSITE_TIME_ZONE"]
  }
  depends_on = [
    azurerm_service_plan.asp_oms_qas,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_network_security_group_association.nsg_asso_integration,azurerm_subnet_route_table_association.rt_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-626" {
  app_service_name    = "salestools-web-oms-qas"
  hostname            = "oms-qas.durbell.com"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-619,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-627" {
  app_service_name    = "salestools-web-oms-qas"
  hostname            = "salestools-web-oms-qas.azurewebsites.net"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-619,
  ]
}
resource "azurerm_windows_web_app" "res-865" {
  app_settings = {
    APPINSIGHTS_INSTRUMENTATIONKEY             = "c8e18d76-cb16-4297-9841-b1eb6ad08ca8"
    APPLICATIONINSIGHTS_CONNECTION_STRING      = "InstrumentationKey=c8e18d76-cb16-4297-9841-b1eb6ad08ca8;IngestionEndpoint=https://eastasia-1.in.applicationinsights.azure.com/"
    ApplicationInsightsAgent_EXTENSION_VERSION = "~2"
    WEBSITE_TIME_ZONE                          = "SE Asia Standard Time"
    XDT_MicrosoftApplicationInsights_Mode      = "default"
  }
  client_affinity_enabled   = true
  https_only                = true
  location                  = "eastasia"
  name                      = "services-salestools-oms-qas"
  resource_group_name       = "oms-qas"
  service_plan_id           = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Web/serverfarms/plan-oms-qas"
  virtual_network_subnet_id = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/oms-qas/providers/Microsoft.Network/virtualNetworks/vnet-durbll-oms-qas-sea-01/subnets/IntregrationSubnet"
  logs {
    http_logs {
      azure_blob_storage {
        retention_in_days = 30
        sas_url           = "https://stroageomsqas.blob.core.windows.net/webserverlogs?sp=rwdl&st=2021-11-15T07:44:45Z&se=2221-11-15T07:44:45Z&sv=2020-08-04&sr=c&sig=XtUV1OUzWNqZlTOoU%2BeJQ9pn%2FKQodlteGtvQohH6SKg%3D"
      }
    }
  }
  site_config {
    ftps_state              = "FtpsOnly"
    scm_minimum_tls_version = "1.0"
    vnet_route_all_enabled  = true
    ip_restriction {
      ip_address = "122.155.162.24/24"
      priority   = 1000
    }
    ip_restriction {
      ip_address = "40.65.191.69/24"
      priority   = 1001
    }
    ip_restriction {
      ip_address = "23.97.61.221/24"
      priority   = 800
    }
  }
  depends_on = [
    azurerm_service_plan.asp_oms_qas,
    # One of azurerm_subnet.subnet_integration,azurerm_subnet_network_security_group_association.nsg_asso_integration,azurerm_subnet_route_table_association.rt_asso_integration (can't auto-resolve as their ids are identical)
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-869" {
  app_service_name    = "services-salestools-oms-qas"
  hostname            = "oms-services-qas.durbell.com"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-865,
  ]
}
resource "azurerm_app_service_custom_hostname_binding" "res-870" {
  app_service_name    = "services-salestools-oms-qas"
  hostname            = "services-salestools-oms-qas.azurewebsites.net"
  resource_group_name = "oms-qas"
  depends_on = [
    azurerm_windows_web_app.res-865,
  ]
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-1108" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - oms-connect-qas"
  resource_group_name = "oms-qas"
  scope_resource_ids  = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/oms-qas/providers/microsoft.insights/components/oms-connect-qas"]
  severity            = "Sev3"
  action_group {
    ids = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/tcp-van-qas/providers/microsoft.insights/actiongroups/application insights smart detection"]
  }
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-1109" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - salestools-report-oms-qas"
  resource_group_name = "oms-qas"
  scope_resource_ids  = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/oms-qas/providers/microsoft.insights/components/salestools-report-oms-qas"]
  severity            = "Sev3"
  action_group {
    ids = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/tcp-van-qas/providers/microsoft.insights/actiongroups/application insights smart detection"]
  }
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-1110" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - salestools-web-oms-qas"
  resource_group_name = "oms-qas"
  scope_resource_ids  = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/oms-qas/providers/microsoft.insights/components/salestools-web-oms-qas"]
  severity            = "Sev3"
  action_group {
    ids = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/tcp-van-qas/providers/microsoft.insights/actiongroups/application insights smart detection"]
  }
}
resource "azurerm_monitor_smart_detector_alert_rule" "res-1111" {
  description         = "Failure Anomalies notifies you of an unusual rise in the rate of failed HTTP requests or dependency calls."
  detector_type       = "FailureAnomaliesDetector"
  frequency           = "PT1M"
  name                = "Failure Anomalies - services-salestools-oms-qas"
  resource_group_name = "oms-qas"
  scope_resource_ids  = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/oms-qas/providers/microsoft.insights/components/services-salestools-oms-qas"]
  severity            = "Sev3"
  action_group {
    ids = ["/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourcegroups/tcp-van-qas/providers/microsoft.insights/actiongroups/application insights smart detection"]
  }
}
resource "azurerm_application_insights" "res-1112" {
  application_type    = "web"
  location            = "eastasia"
  name                = "oms-connect-qas"
  resource_group_name = "oms-qas"
  sampling_percentage = 0
  workspace_id        = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/defaultresourcegroup-sea/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-000622a4-e7c4-4fb5-8481-aec97b7970e7-sea"
}
resource "azurerm_application_insights" "res-1113" {
  application_type    = "web"
  location            = "eastasia"
  name                = "salestools-report-oms-qas"
  resource_group_name = "oms-qas"
  sampling_percentage = 0
  workspace_id        = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/defaultresourcegroup-sea/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-000622a4-e7c4-4fb5-8481-aec97b7970e7-sea"
}
resource "azurerm_application_insights" "res-1114" {
  application_type    = "web"
  location            = "eastasia"
  name                = "salestools-web-oms-qas"
  resource_group_name = "oms-qas"
  sampling_percentage = 0
  workspace_id        = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/defaultresourcegroup-sea/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-000622a4-e7c4-4fb5-8481-aec97b7970e7-sea"
}
resource "azurerm_application_insights" "res-1115" {
  application_type    = "web"
  location            = "eastasia"
  name                = "services-salestools-oms-qas"
  resource_group_name = "oms-qas"
  sampling_percentage = 0
  workspace_id        = "/subscriptions/000622a4-e7c4-4fb5-8481-aec97b7970e7/resourceGroups/defaultresourcegroup-sea/providers/Microsoft.OperationalInsights/workspaces/defaultworkspace-000622a4-e7c4-4fb5-8481-aec97b7970e7-sea"
}
*/