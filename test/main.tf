provider "azurerm" {
  features {}
}

module "kubernetes_service" {
  source = "../src"

  environment                = "foo"
  identifier                 = "baz"
  kubernetes_version         = "1.2.3"
  location                   = "uksouth"
  log_analytics_workspace_id = "quz"
  resource_group_name        = "floof"
  subnet_id                  = "blurble"
  workload_name              = "foo"
  workload_type              = "foo/bar"
  workload_version           = "1.0.0"
  zone                       = "bat"

  tags = {
    Foo = "Bar"
  }
}
