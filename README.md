# Terraform

Provisioning tool:
Terraform Part1


terraform --version

(https://registry.terraform.io/providers)[List TF providers and other docs]

Terraform file: any name w/ .tf extension

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

Init: Download files for this resource.
.terraform.lock.hcl - locks provider & version. Can be moved with project to save versions of providers if it needed. Can be saved to the repo. Or ignored.

<em>Terraform loads modules in the alphabetic order.</em>

Plan: List of actions that need to be done to achive the desired state.
Arguments "-out" creates output file with accurate list of actions.

Apply: Execute actions to achive the desired state.

terraform.tfstate - file that contains info about resources that were created on Apply step. Don't edit it manually.


terraform destroy - remote resources created by TF.

During updates TF usually destroys resource even when change file permisions.


terraform state list - get name of resource that managed now.

terraform state show loca_file.foo - show resource particular resource info


.terraform dir -dir that contains proveiders used (specific version that was downloaded during Init step)

<br>
<b>Variables</b>

Declaration with default value:

    variable "filename" {
        default = "/tmp/file.txt"
    }

Variable call:

Picks var w/ the same name

    resource "local_file" "list" {
      filename = var.filename
      content = var.content
      type = string
    }

Variable type is option, also description can be added. There are 7 types of vars. Default = any.

Variable interpolation to the sting use: ${var.varvalue}

To pass vars it's possible to:

Create variables.tf file. Add vars like:

        variable "filename" {
            default = "/tmp/kvtest.txt"
            type = string
        }

This file for vars definitions (not values, except defaults). Not necessary, but recommended for big projects.

Add to the main tf file keywoard "var.$VARNAME".

If value will not have default value then it will be asked interactively.

${path.module} - standart var that describes current TF module. Path where actual main.tf file stored.

1. Apply vars in CLI:

    terraform apply -var "filename=/tmp/filevar.txt" -var "content=contentvar"

3. Also it's possible export to ENV TF_VAR_filename=/tmp/envvar" then run apply w/o these vars.

4. terraform.tfvars - file with vars values. Vars in config file have higher priority.
It's also possible to store values in terrafor.tfvars.json - to store vars in JSON format.

        {
          "filename":"/tmp/jsonvar",
          "content": "jsontext"
        }

Terraform saves last var's file that was used.

Specify var's file with parameters: terraform apply -var-file=tf-var-file.tfvars

<b>providers.tf</b> - contains info about providers. For example, it can copied from Azure's docs.

