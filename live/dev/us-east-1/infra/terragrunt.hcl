include "root" {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../..//modules/infra/"
}

locals {
    vars = yamldecode(file("${find_in_parent_folders("vars.yaml")}"))
}

inputs = {
    account_id        = local.vars.account_id
    region            = local.vars.region
    tags              = local.vars.tags
    ec2_ami           = local.vars.ec2_ami
    ec2_instance_type = local.vars.ec2_instance_type
}
