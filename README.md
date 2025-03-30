![azure-base](https://github.com/2plus2cabbage/2plus2cabbage/blob/main/images/azure-base.png)

# Azure Windows Instance Terraform Deployment

Deploys a Windows Server 2022 VM in Microsoft Azure with RDP and internet access.

## Files
The project is split into multiple files to illustrate modularity and keep separate constructs distinct, making it easier to manage and understand.
- `main.tf`: Terraform provider block (`hashicorp/azurerm`).
- `azureprovider.tf`: Azure provider config with `subscription_id`, `client_id`, etc.
- `variables.tf`: Variables and locals for subscription, region, etc.
- `terraform.tfvars.template`: Template for sensitive/custom values; rename to `terraform.tfvars` and add your credentials.
- `locals.tf`: Local variables for naming conventions.
- `networking.tf`: VNet, subnet.
- `securitygroup.tf`: Network security group for RDP (TCP 3389) and outbound traffic.
- `routing-static.tf`: Route table for internet access.
- `resourcegroup.tf`: Resource group.
- `windows.tf`: Windows VM, outputs public/private IPs.

## How It Works
- **Networking**: VNet and subnet provide connectivity. Route table enables inbound/outbound traffic.
- **Security**: Allows RDP from your IP and all outbound traffic.
- **Instance**: Windows Server 2022 VM with public IP, firewall disabled via extension.

## Prerequisites
- An Azure account with a subscription.
- An App Registration with Contributor role, noting `subscription_id`, `client_id`, `client_secret`, `tenant_id`.
- Terraform installed on your machine.
- Examples are demonstrated using Visual Studio Code (VSCode).

## Deployment Steps
1. Update `terraform.tfvars` with Azure credentials, admin username, admin password, and your public IP in `my_public_ip`.
2. Run `terraform init`, then (optionally) `terraform plan` to preview changes, then `terraform apply` (type `yes`).
3. Get the public IP from the `azure_vm_public_ip` output on the screen, or run `terraform output azure_vm_public_ip`, or check in the Azure Portal under **Virtual Machines**.
4. Get the initial username and password from `terraform.tfvars` (`admin_username` and `windows_admin_password`).
5. Use Remote Desktop to log in with the username and password; change the password on first login.
6. To remove all resources, run `terraform destroy` (type `yes`).

## Potential costs and licensing
- The resources deployed using this Terraform configuration should generally incur minimal to no costs, provided they are terminated promptly after creation.
- It is important to fully understand your cloud provider's billing structure, trial periods, and any potential costs associated with the deployment of resources in public cloud environments.
- You are also responsible for any applicable software licensing or other charges that may arise from the deployment and usage of these resources.