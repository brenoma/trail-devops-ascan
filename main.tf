module "new-network" {
  source = "./modules/network"
  NUMBER_OF_SUBNETS = 2
}

module "new-application" {
  source = "./modules/applications"
  PUBLIC_KEY_SSH = var.PUBLIC_KEY_SSH
  SUBNET_ID = module.new-network.subnet-id[0]
  SG_ID = module.new-network.sg-id
  depends_on = [
    module.new-network
  ]
}

module "new-cloudwatch" {
  source = "./modules/cloudwatch"
  depends_on = [
    module.new-application
  ]
}
