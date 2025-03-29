locals {
  vnet_name                  = "vnet-${var.environment_name}-${var.location}-"          # Prefix for VNet name
  subnet_name_prefix         = "snet-${var.environment_name}-${var.location}-"          # Prefix for subnet name
  windows_name_prefix        = "vm-${var.environment_name}-${var.location}-windows-"    # Prefix for Windows VM name
  security_group_name_prefix = "nsg-${var.environment_name}-${var.location}-"           # Prefix for network security group name
  network_interface_prefix   = "nic-${var.environment_name}-${var.location}-"           # Prefix for network interface name
  public_ip_prefix           = "pip-${var.environment_name}-${var.location}-"           # Prefix for public IP name
}