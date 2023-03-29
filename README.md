# terraform
Provisioning tool:
Terraform Part1


terraform --version

    resource "local_file" "foo" {
      content  = "foo!"
      filename = "${path.module}/foo.bar"
    }

Where resource type - local_file
Resource name - games
Arguments: filename & content
local - provider
file - resource


3 steps of execution:
Terraform init  -> Plan -> Apply
Init: Download files for this resource
Plan: Actions that need to be done to achive the desired state.
Apply: Execute actions to achive the desired state.

.terraform.lock.hcl - can be moved with project to save versions of providers if it needed.
