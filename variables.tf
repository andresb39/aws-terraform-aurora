variable "alarm_cpu_limit" {
  description = "CloudWatch CPUUtilization Threshold"
  type        = number
  default     = 60
}

variable "alarm_read_iops_limit" {
  description = "CloudWatch Read IOPSLimit Threshold"
  type        = number
  default     = 60
}

variable "alarm_write_iops_limit" {
  description = "CloudWatch Write IOPSLimit Threshold"
  type        = number
  default     = 100000
}

variable "auto_minor_version_upgrade" {
  description = "Boolean value that indicates that minor engine upgrades will be applied automatically to the DB instance during the maintenance window"
  type        = bool
  default     = true
}

variable "backtrack_window" {
  description = "The target backtrack window, in seconds.  Defaults to 1 day. Setting only affects supported versions (currently MySQL 5.6). Disable by setting to '0'."
  type        = number
  default     = 86400
}

variable "backup_retention_period" {
  description = "The number of days for which automated backups are retained. The permissible range is a value between 1-35. The aurora service defaults to 1 day but this module defaults to 35. Rackspace best practice is 30+ days."
  type        = number
  default     = 35
}

variable "backup_window" {
  description = "The daily time range during which automated backups are created if automated backups are enabled."
  type        = string
  default     = "05:00-06:00"
}

variable "binlog_format" {
  description = "Sets the desired format. Defaults to OFF. Should be set to MIXED if this Aurora cluster will replicate to another RDS Instance or cluster. Ignored for aurora-postgresql engine"
  type        = string
  default     = "OFF"
}

variable "cloudwatch_exports_logs_list" {
  description = "List of log types to export to cloudwatch. If omitted, no logs will be exported. The following log types are supported: `audit`, `error`, `general`, `slowquery`."
  type        = list(string)
  default     = []
}

variable "cluster_internal_record_name" {
  description = "The full record name you would like to add as a CNAME for the cluster that matches your Hosted Zone. i.e. cluster.example.com"
  type        = string
  default     = ""
}

variable "cluster_parameters" {
  description = "List of custom cluster parameters to apply to the parameter group."
  type        = list(map(string))
  default     = []
}

variable "create_internal_zone_record" {
  description = "Create an internal Route 53 record for the RDS cluster and cluster reader. Default is false."
  type        = bool
  default     = false
}

variable "db_snapshot_arn" {
  description = "The identifier for the DB cluster snapshot from which you want to restore."
  type        = string
  default     = ""
}

variable "dbname" {
  description = "The DB name to create. If omitted, no database is created initially"
  type        = string
  default     = ""
}

variable "enable_delete_protection" {
  description = "If the DB instance should have deletion protection enabled. The database can't be deleted when this value is set to true. The default is false"
  type        = bool
  default     = false
}

variable "engine" {
  description = "Database Engine Type.  Allowed values: aurora-mysql, aurora, aurora-postgresql"
  type        = string
  default     = "aurora-mysql"
}

variable "engine_mode" {
  description = "The database engine mode. Allowed values: provisioned and global(aurora engine only)."
  type        = string
  default     = "provisioned"
}

variable "engine_version" {
  description = "Database Engine Minor Version http://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_CreateDBInstance.html"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Application environment for which this network is being created. one of: ('Development', 'Integration', 'PreProduction', 'Production', 'QA', 'Staging', 'Test')"
  type        = string
  default     = "Development"
}

variable "existing_cluster_parameter_group_name" {
  description = "The existing cluster parameter group to use for this instance. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "existing_monitoring_role" {
  description = "ARN of an existing enhanced monitoring role to use for this instance. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "existing_parameter_group_name" {
  description = "The existing parameter group to use for this instance. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "existing_subnet_group" {
  description = "The existing DB subnet group to use for this cluster (OPTIONAL)"
  type        = string
  default     = ""
}

variable "family" {
  description = "Parameter Group Family Name (ex. aurora5.6, aurora-postgresql9.6, aurora-mysql5.7)"
  type        = string
  default     = ""
}

variable "global_cluster_identifier" {
  description = "Global Cluster identifier. Property of aws_rds_global_cluster (Ignored if engine_mode is not 'global')."
  type        = string
  default     = ""
}

variable "instance_availability_zone_list" {
  description = <<HEREDOC
List of availability zones to place each aurora instance. Availability zone assignment is by index. The first AZ in the list is assigned to the first instance,
second AZ in the list to the second instance, third AZ in the list to the third instance, etc. Also please remember that the number of AZs specified here should equal to replica_instances + 1.
HEREDOC
  type        = list(string)
  default     = [""]
}

variable "instance_class" {
  description = "The database instance type."
  type        = string
}

variable "internal_zone_id" {
  description = "The zone id you would like the internal records for the cluster and reader to be created in. i.e. Z2QHD5YD1WXE9M"
  type        = string
  default     = ""
}

variable "kms_key_id" {
  description = "KMS Key Arn to use for storage encryption. (OPTIONAL)"
  type        = string
  default     = ""
}

variable "maintenance_window" {
  description = "The weekly time range (in UTC) during which system maintenance can occur."
  type        = string
  default     = "Sun:07:00-Sun:08:00"
}

variable "monitoring_interval" {
  description = "The interval, in seconds, between points when Enhanced Monitoring metrics are collected for the DB instance. To disable collecting Enhanced Monitoring metrics, specify 0. The default is 0. Valid Values: 0, 1, 5, 10, 15, 30, 60."
  type        = number
  default     = 0
}

variable "name" {
  description = "The name prefix to use for the resources created in this module."
  type        = string
}

variable "notification_topic" {
  description = "List of SNS Topic ARNs to use for customer notifications from CloudWatch alarms. (OPTIONAL)"
  type        = list(string)
  default     = []
}

variable "options" {
  description = "List of custom options to apply to the option group."
  type        = list(string)
  default     = []
}

variable "parameters" {
  description = "List of custom parameters to apply to the parameter group."
  type        = list(map(string))
  default     = []
}

variable "password" {
  description = "Password for the local administrator account."
  type        = string
}

variable "performance_insights_enable" {
  description = "Specifies whether Performance Insights is enabled or not."
  type        = bool
  default     = false
}

variable "performance_insights_kms_key_id" {
  description = "(Optional) The ARN for the KMS key to encrypt Performance Insights data. When specifying performance_insights_kms_key_id, performance_insights_enabled needs to be set to true."
  type        = string
  default     = ""
}

variable "port" {
  description = "The port on which the DB accepts connections"
  type        = string
  default     = ""
}

variable "publicly_accessible" {
  description = "Boolean value that indicates whether the database instances are Internet-facing."
  type        = bool
  default     = false
}

variable "rackspace_alarms_enabled" {
  description = "Specifies whether non-emergency rackspace alarms will create a ticket."
  type        = bool
  default     = false
}

variable "rackspace_managed" {
  description = "Boolean parameter controlling if instance will be fully managed by Rackspace support teams, created CloudWatch alarms that generate tickets, and utilize Rackspace managed SSM documents."
  type        = bool
  default     = true
}

variable "reader_internal_record_name" {
  description = "The full record name you would like to add as a CNAME for the cluster reader. i.e. reader.example.com"
  type        = string
  default     = ""
}

variable "replica_instances" {
  description = "The number of Aurora replica instances to create.  This can range from 0 to 15."
  type        = number
  default     = 1
}

variable "security_groups" {
  description = "A list of EC2 security groups to assign to this resource"
  type        = list(string)
}

variable "skip_final_snapshot" {
  description = "Boolean value to control if the DB Cluster will take a final snapshot when destroyed.  This value should be set to false if a final snapshot is desired."
  type        = bool
  default     = false
}

variable "source_cluster" {
  description = "The cluster ID of the master Aurora cluster that will replicate to the created cluster. The master must be in a different region. Leave this parameter blank to create a master Aurora cluster."
  type        = string
  default     = ""
}

variable "source_region" {
  description = "The region of the master Aurora cluster that will replicate to the created cluster. The master must be in a different region. Leave this parameter blank to create a master Aurora cluster."
  type        = string
  default     = ""
}

variable "storage_encrypted" {
  description = "Specifies whether the DB instance is encrypted"
  type        = bool
  default     = false
}

variable "subnets" {
  description = "Subnets for RDS Instances"
  type        = list(string)
}

variable "tags" {
  description = "Custom tags to apply to all resources."
  type        = map(string)
  default     = {}
}

variable "username" {
  description = "The name of master user for the client DB instance."
  type        = string
  default     = "dbadmin"
}

