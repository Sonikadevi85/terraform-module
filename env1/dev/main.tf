module "resource_group_rg" {
  source   = "../../projecthcl/rg"
  hclvarrg = var.hclvarrg
}
module "resource_group_vnet" {
  source     = "../../projecthcl/vnet"
  hclvnet    = var.hclvnet
  depends_on = [module.resource_group_rg]
}
module "resource_group_subnet" {
  source     = "../../projecthcl/subnet"
  hclsubnet  = var.hclsubnet
  depends_on = [module.resource_group_vnet]
}
module "resource_group_public_ip" {
  source     = "../../projecthcl/pip"
  hclpip     = var.hclpip
  depends_on = [module.resource_group_subnet]
}
module "resource_group_nic" {
  source     = "../../projecthcl/nic"
  hclnic     = var.hclnic
  depends_on = [module.resource_group_subnet]
}
module "resource_group_bastion_host" {
  source     = "../../projecthcl/bastion"
  hclbastion = var.hclbastion
  depends_on = [module.resource_group_vnet]
}
module "resource_group_keyvalt" {
  source      = "../../projecthcl/keyvault"
  hclkeyvault = var.hclkeyvault
  depends_on  = [module.resource_group_rg]
}
module "resource_vm" {
  source     = "../../projecthcl/vm"
  hclvm      = var.hclvm
  depends_on = [module.resource_group_nic, module.resource_group_rg]
}