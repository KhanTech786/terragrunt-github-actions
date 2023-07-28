include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../../modules/infra/"
}

locals {
    vars = yamldecode(file("${find_in_parent_folders("vars.yaml")}"))
}

inputs = {
    region            = local.vars.region
    tags              = local.vars.tags
    ec2_ami_west      = local.vars.ec2_ami_west
    ec2_ami_east      = local.vars.ec2_ami_east
    ec2_instance_type = local.vars.ec2-instance_type
}
