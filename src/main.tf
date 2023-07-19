resource "azurerm_kubernetes_cluster" "main" {
  name                = "${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}-aks"
  location            = var.location
  resource_group_name = var.resource_group_name

  dns_prefix          = "${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}"
  kubernetes_version  = var.kubernetes_version
  node_resource_group = "${var.zone}-${var.environment}-${lookup(local.short_locations, var.location)}-${local.identifier}aksinfra-rg"

  azure_policy_enabled = true

  default_node_pool {
    name = "system"

    node_count                  = var.node_count
    temporary_name_for_rotation = "tmp"
    vm_size                     = var.vm_size
    vnet_subnet_id              = var.subnet_id
    zones                       = var.zones

    tags = merge(var.tags, local.tags)
  }

  identity {
    type = "SystemAssigned"
  }

  key_vault_secrets_provider {
    secret_rotation_enabled = true
  }

  microsoft_defender {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  oms_agent {
    log_analytics_workspace_id = var.log_analytics_workspace_id
  }

  tags = merge(var.tags, local.tags)
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name                       = "log-analytics"
  target_resource_id         = azurerm_kubernetes_cluster.main.id
  log_analytics_workspace_id = var.log_analytics_workspace_id

  metric {
    category = "AllMetrics"

    retention_policy {
      days    = 0
      enabled = false
    }
  }
}
