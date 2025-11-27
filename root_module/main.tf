module "rgtest" {

  source = "../child_module/RG"
  rg     = var.rg
}

module "vnettest" {
  source     = "../child_module/VNET"
  vnet       = var.vnet
  depends_on = [module.rgtest]
}


module "subnettest" {
  source     = "../child_module/SUBNET"
  subnet     = var.subnet
  depends_on = [module.vnettest]
}

module "nsgtest" {
  source     = "../child_module/NSG"
  nsg        = var.nsg
  depends_on = [module.rgtest]
}

module "piptest" {
  source     = "../child_module/PIP"
  pip        = var.pip
  depends_on = [module.rgtest]
}


module "nictest" {
  source     = "../child_module/NIC"
  nic        = var.nic
  depends_on = [module.subnettest, module.nsgtest, module.piptest]
}

module "nicnsgtest" {
  source     = "../child_module/NICNSG"
  nicnsg     = var.nicnsg
  depends_on = [module.subnettest, module.nictest]

}

module "vmtest" {
  source     = "../child_module/VM"
  vm         = var.vm
  depends_on = [module.nictest, module.piptest, module.rgtest]
}




