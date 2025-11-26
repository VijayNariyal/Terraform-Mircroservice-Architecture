module "RG" {
  source         = "../../Modules/RG"
  resource_group = var.rgs
}

module "VNet" {
  depends_on       = [module.RG]
  source           = "../../Modules/VNet"
  virtual_networks = var.vnets
}

module "NSG" {
  depends_on              = [module.VNet]
  source                  = "../../Modules/NSG"
  network_security_groups = var.nsgs
}

module "ACR" {
  depends_on         = [module.RG]
  source             = "../../Modules/ACR"
  container_registry = var.acrs
}

module "AKS" {
  depends_on   = [module.RG, module.ACR]
  source       = "../../Modules/AKS"
  aks_clusters = var.aks_cluster

}
