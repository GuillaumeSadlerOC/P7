####################################
# KEY PAIR     
####################################
variable "kp_key_name" {
    description = "(Optional) The name for the key pair."
    type = string
    default = null
}

variable "kp_key_name_prefix" {
    description = "(Optional) Creates a unique name beginning with the specified prefix."
    type = string
    default = null
}

variable "kp_tags" {
    description = "(Optional) Key-value map of resource tags."
    type = map(string)
    default = null
}

####################################
# PROVISIONER     
####################################
variable "script_source"{
    description = "(Optional)"
    type = string
    default = "script.sh"
}

variable "script_destination"{
    description = "(Optional)"
    type = string
    default = "/tmp/script.sh"
}

variable "inline"{
    description = "(Optional)"
    type = list(string)
    default = null
}

####################################
# EC2     
####################################
variable "public_ip" {
    description = "(Optional)"
    type = string
    default = null
}

variable "ami" {
    description = "(Required) AMI to use for the instance."
    type = string
    default = null
}

variable "associate_public_ip_address" {
    description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
    type = string
    default = null
}

variable "availability_zone" {
    description = "(Optional) AZ to start the instance in."
    type = string
    default = null
}

variable "cpu_core_count" {
    description = "(Optional) Sets the number of CPU cores for an instance. This option is only supported on creation of instance type that support CPU Options CPU Cores and Threads Per CPU Core Per Instance Type - specifying this option for unsupported instance types will return an error from the EC2 API."
    type = string
    default = null
}

variable "cpu_threads_per_core" {
    description = "(Optional - has no effect unless cpu_core_count is also set) If set to to 1, hyperthreading is disabled on the launched instance. Defaults to 2 if not set. See Optimizing CPU Options for more information."
    type = string
    default = null
}

variable "credit_specification" {
    description = "(Optional) Customize the credit specification of the instance. See Credit Specification below for more details."
    type = string
    default = null
}

variable "disable_api_termination" {
    description = "(Optional) If true, enables EC2 Instance Termination Protection."
    type = string
    default = null
}

variable "ebs_block_device" {
    description = "(Optional) Additional EBS block devices to attach to the instance. Block device configurations only apply on resource creation. See Block Devices below for details on attributes and drift detection."
    type = list(string)
    default = null
}

variable "ebs_optimized" {
    description = "(Optional) If true, the launched EC2 instance will be EBS-optimized. Note that if this is not set on an instance type that is optimized by default then this will show as disabled but if the instance type is optimized by default then there is no need to set this and there is no effect to disabling it. See the EBS Optimized section of the AWS User Guide for more information."
    type = string
    default = null
}

variable "get_password_data" {
    description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows. The password data is exported to the password_data attribute. See GetPasswordData for more information."
    type = string
    default = null
}

variable "hibernation" {
    description = "(Optional) If true, the launched EC2 instance will support hibernation."
    type = string
    default = null
}

variable "host_id" {
    description = "(Optional) ID of a dedicated host that the instance will be assigned to. Use when an instance is to be launched on a specific dedicated host."
    type = string
    default = null
}

variable "iam_instance_profile" {
    description = "(Optional) IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile. Ensure your credentials have the correct permission to assign the instance profile according to the EC2 documentation, notably iam:PassRole."
    type = string
    default = null
}

variable "instance_initiated_shutdown_behavior" {
    description = "(Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances. See Shutdown Behavior for more information."
    type = string
    default = null
}

variable "instance_type" {
    description = "(Required) Type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
    type = string
    default = null
}

variable "ipv6_address_count" {
    description = "(Optional) A number of IPv6 addresses to associate with the primary network interface. Amazon EC2 chooses the IPv6 addresses from the range of your subnet."
    type = string
    default = null
}

variable "ipv6_addresses" {
    description = "(Optional) Specify one or more IPv6 addresses from the range of the subnet to associate with the primary network interface"
    type = list(string)
    default = null
}

variable "key_name" {
    description = "(Optional) Key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
    type = string
    default = null
}

variable "metadata_options" {
    description = "(Optional) Customize the metadata options of the instance. See Metadata Options below for more details."
    type = map(any)
    default = null
}

variable "monitoring" {
    description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled. (Available since v0.6.0)"
    type = string
    default = null
}

variable "network_interface" {
    description = "(Optional) Customize network interfaces to be attached at instance boot time. See Network Interfaces below for more details."
    type = list(string)
    default = null
}

variable "placement_group" {
    description = "(Optional) Placement Group to start the instance in."
    type = string
    default = null
}

variable "private_ip" {
    description = "(Optional) Private IP address to associate with the instance in a VPC."
    type = string
    default = null
}

variable "root_block_device" {
    description = "(Optional) Customize details about the root block device of the instance. See Block Devices below for details."
    type = list(string)
    default = null
}

variable "secondary_private_ips" {
    description = "(Optional) A list of secondary private IPv4 addresses to assign to the instance's primary network interface (eth0) in a VPC. Can only be assigned to the primary network interface (eth0) attached at instance creation, not a pre-existing network interface i.e. referenced in a network_interface block. Refer to the Elastic network interfaces documentation to see the maximum number of private IP addresses allowed per instance type."
    type = list(string)
    default = null
}

variable "security_groups" {
    description = "(Optional, EC2-Classic and default VPC only) A list of security group names (EC2-Classic) or IDs (default VPC) to associate with."
    type = list(string)
    default = null
}

variable "source_dest_check" {
    description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
    type = string
    default = null
}

variable "subnet_id" {
    description = "(Optional) VPC Subnet ID to launch in."
    type = string
    default = null
}

variable "tags" {
    description = "(Optional) A map of tags to assign to the resource. Note that these tags apply to the instance and not block storage devices."
    type = map(string)
    default = null
}

variable "tenancy" {
    description = "(Optional) Tenancy of the instance (if the instance is running in a VPC). An instance with a tenancy of dedicated runs on single-tenant hardware. The host tenancy is not supported for the import-instance command."
    type = string
    default = null
}

variable "user_data" {
    description = "(Optional) User data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
    type = string
    default = null
}

variable "user_data_base64" {
    description = "(Optional) Can be used instead of user_data to pass base64-encoded binary data directly. Use this instead of user_data whenever the value is not a valid UTF-8 string. For example, gzip-encoded user data must be base64-encoded and passed via this argument to avoid corruption."
    type = string
    default = null
}

variable "volume_tags" {
    description = "(Optional) A map of tags to assign, at instance-creation time, to root and EBS volumes."
    type = map(string)
    default = null
}

variable "vpc_security_group_ids" {
    description = "(Optional, VPC only) A list of security group IDs to associate with."
    type = list(string)
    default = null
}
