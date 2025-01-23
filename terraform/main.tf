terraform {
  backend "azurerm" {
    resource_group_name  = "myrg"
    storage_account_name = "kadirstorage25"
    container_name       = "vm-container"
    key                  = "vm.terraform.tfstate"
  }
}
module "RG" {
  source   = "./modules/RG" #A
  rgname   = var.rgname     #B
  location = var.location
}
module "SA" {
  source     = "./modules/StorageAccount"
  depends_on = [module.RG]
  sname      = var.sname
  rgname     = var.rgname
  location   = var.location
}
