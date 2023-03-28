resource "azurerm_kubernetes_cluster" "threenode" {
  name                = "example-aks1"
  location            = azurerm_resource_group.lab_rsg.location
  resource_group_name = azurerm_resource_group.lab_rsg.name
  dns_prefix          = "ovitlab"    
  
  default_node_pool {
  name       = "default"
  node_count = 1
  vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "Dev"
  }
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.example.kube_config.0.client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.example.kube_config_raw

  sensitive = true
}