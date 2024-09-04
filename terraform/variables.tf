#MODULE 1
variable "subnet_group_name" {
  description = "Subnet group name for rds instance."
  type = string
  default = ""
}

variable "subnet_one" {
  description = "Subnet 1 from the same VPC, but different availability zone."
  type = string
  default = "" 
}

variable "subnet_two" {
  description = "Subnet 2 from the same VPC, but different availability zone."
  type = string
  default = "" 
}

variable "vpc" {
 description = "DB VPC" 
 type = string
 default = ""
}


variable "db_name" {
    description = "Name for database on this instance."
    type = string
    default = ""
}

variable "db_username" {
    description = "DB username"
    type = string
    default = ""
}

variable "db_passwd" {
    description = "DB passwd"
    type = string
    default = ""
}

variable "eks_sg1" {
  description = "EKS Cluster Security Group 1"
  type = string
  default = ""
}
variable "eks_sg2" {
  description = "EKS Cluster Security Group 2"
  type = string
  default = ""
}

variable "db_sg_name" {
  description = "Name for security group for db instance."
  type = string
  default = ""
}

variable "engine" {
  description = "Engine Type."
  type = string
  default = ""
}

variable "engine_version" {
  description = "Engine version"
  type = string
  default = ""
}

variable "instance_class" {
  description = "Instance class"
  type = string
  default = ""
}

variable "allocated_storage" {
  description = "Allocated storage"
  type = number
  default = 20
}

#MODULE 2
variable "username_for_secrets_reader_user" {
  description = "User with premissions for reading secrets."
  type = string
  default = "aws_secrets_manager_user_mihailo"
}

variable "user_policy_name" {
  description = "Policy name for user accessing AWS secrets manager."
  type = string
  default = "userpolicymihailo"
}

variable "secrets_name_ESO" {
  description = "Secret name from secret manager"
  type = string
  default = "mihailo_nextcloud_secrets" //import from additional module
}

variable "region" {
  description = "Region for storing resources on AWS"
  type = string
  default = "eu-central-1"
}

variable "account_id" {
  description = "ID of the user with grants to access s3 bucket"
  type = string
  default="976552365380"
}

#MODULE 3

variable "cluster_oidc_id" {
  description = "Cluster OIDC ID."
  type = string
  default = ""
}

variable "namespace_r53" {
  description = "Namespace for resource deployment."
  type = string
  default = ""
}

variable "service_account_name_r53" {
  description = "Service account name."
  type = string
  default=""
}
variable "iam_role_name" {
  description = "IAM role  for Route 53 access name."
  type = string
  default = ""
}

variable "academy_zone_id" {
  description = "ID of a hosted zone we want to give EKS premissions to."
  type = string
  default = ""
}



#MODULE 3

variable "region_s3" {
  description = "Region for resource deployment"
  type = string
  default = ""
}

variable "namespace_s3" {
  description = "Namespace for resource deployment"
  type = string
  default = ""
}

variable "service_account_name_s3" {
  description = "Name for future service account."
  type = string
  default="" //will be created in the future
}


variable "bucket_name" {
  description = "Nextcloud S3 bucket name"
  type = string
  default = ""

}

variable "access_role4_s3_bucket" {
  description = "Access role for s3 bucket"
  type = string
  default = ""
}

#MODULE 4,5

variable "ebs_size" {
  description = "EBS volume for persistent volumes on EKS"
  type = number
  default = 10
}

variable "az" {
  description = "Availability zone for our resources."
  type = string
  default = ""
}

# MODUL 6

variable "helm_release" {
  description = "Name of release."
  type = string
  default = "" //future name of nextcloud service 
}

variable "chart_version" {
  description = "Chart version."
  type = string
  default = ""
}

variable "path_to_the_chart" {
  description = "Path to the chart folder."
  type = string
  default = ""
}

#MODUL 7

variable "name" {
description = "Chart name."
type = string
default = ""
}

variable "repository" {
description = "Repository name."
type = string
default = ""
}

variable "chart" {
description = "Chart name."
type = string
default = ""
}

variable "namespace" {
description = "Nemaspace"
type = string
default = ""
}

#MODUL 8
variable "name_ing" {
  description = "Name  of a ingress resource"
  type = string
  default = ""
}

variable "namespace_ing" {
  description = "Namespace for ingress resource"
  type = string
  default = ""
}

variable "ingress_class_name" {
  description = "Ingress class name."
  type = string
  default = ""
}

variable "host" {
  description = "Host."
  type = string
  default = ""
}

variable "path" {
  description = "Path for a specific domain."
  type = string
  default = ""
}

variable "service_name" {
  description = "Name of the pod service running nextcloud release."
  type = string
  default = "" //depends on
}

variable "service_port" {
  description = "Port of a running service we want to commmunicate to."
  type = number
  default = 8080
}

variable "service_account_name" {
  description = "Service account name"
  type = string
  default = "futureserviceaccount"
  
}
#MODULE 9

variable "s3_access_role_name" {
  description = "S3 access role name"
  type = string
  default = "" //depends on
}

variable "user_id" {
  description = "AWS user id."
  type = string
  default = ""
}

#MODULE 10

variable "service_account_namespace" {
    description = "Service account namespace."
    type = string
    default = ""
}

variable "r53_access_role_name" {
  description = "Route 53 access role name"
  type = string
  default = "" //depends on
}

#MODULE 11

variable "eks_node_group_role" {
  description = "Role for EKS cluster's nodes to authenticate."
  type = string
  default = ""
}

#MODULE 12


variable "pv_name" {
  description = "Persistant volume name."
  type = string
  default = ""
}

variable "access_mode" {
  description = "PV Access Mode."
  type = string
  default = ""
}

variable "storage" {
  description = "PV's storage capacity."
  type = string
  default = ""
}

variable "driver" {
  description = "AWS EBS driver."
  type = string
  default = ""
}

variable "volume_handle" {
  description = "Volume ID from AWS EBS volume."
  type = string
  default = "" //depends on
}

variable "storage_class_name" {
  description = "Name of the storage class."
  type = string
  default = "" 
}

variable "persistent_volume_reclaim_policy" {
  description = "Persistent volume's reclaim policy."
  type = string
  default = ""
}

#MODULE 13

variable "helm_repo_name" {
  description = "Name of helm repository."
  type = string
  default = ""
}

variable "helm_release_name" {
  description = "Release name."
  type = string
  default = ""
}

variable "helm_release_chart" {
  description = "Chart name."
  type = string
  default = ""
}

#MODULE 14

variable "user_access_key" {
    description = "Access key of IAM user."
    type = string
    default = ""  //depends on
}

variable "user_secret_access_key" {
  description = "Secret access key of IAM user."
  type = string
  default = "" //depends on
}

variable "secrets_name" {
    description = "Name of the secret."
    type = string
    default = ""  
}

variable "access_key_key" {
   description = "Key value for Secrets Manager AWS IAM user access key."
   type = string
   default = ""
}

variable "secret_access_key_key" {
   description = "Key value for Secrets Manager AWS IAM user secret access key."
   type = string
   default = ""
}

#MODULE 15

variable "secret_store_name" {
description = "Secret store name."
type = string
default = ""
}


variable "access_key" { //depends on  
description = "Key value of access key stored in secrets manager on AWS."
type = string
default = "" 
}


variable "secret_access_key" { //depends on 
description = "Key value of secret access key stored in secrets manager on AWS."
type = string
default = ""
}

variable "aws_auth_secret" {
description = "Secret where AWS IAM user credentials are stored."
type = string
default = "" //depends on 
}

#MODULE 16

variable "external_secret_name" {
description = "External secret name."
type = string
default="exampleexternalsecret"
}



variable "new-secret" {
description = "Newlly generated secret name."
type = string
default="kube-secret"
}

variable "secret_manager_secret_name" {
description = "Secret name."
type=string
default="" //depends on preko secret managera
}

variable "depends_on_one" {
  description = "Dependency one. "
  type = any
  default = ""
}

variable "depends_on_two" {
  description = "Dependency two." 
  type = any
  default = ""
}

variable "secret_description" {
  description = "Description of a secret created."
  type = string
  default = "Test secret."
}

variable "secret_name" {
  description = "Description of a secret created."
  type = string
  default = "Test secret."
}

variable "external_secret_namespace" {
  description = "ES namespace."
  type = any
  default = ""
}

variable "secret_store_namespace" {
  description = "SS namespace."
  type = any
  default = ""
}

# MODULE NEXTCLOUD HELM CHART DEPLOYMENT AND VALUES.YAML


#-------------------------Chart values.yaml variables-------------------------------------------------



variable "nextcloud_username" {
  description = "Nextcloud username."
  type = string
  default = ""
}

variable "nextcloud_password" {
  description = "Nextcloud password."
  type = string
  default = ""
}

variable "db_secret_name" {
  description = "Secret name for db creds secret."
  type = string
  default = ""
}

variable "hostKey" {
  description = "Key value for host storing into secret."
  type = string
  default = ""
}

variable "usernameKey" {
  description = "Key value for username storing into secret."
  type = string
  default = ""
}

variable "passwdKey" {
  description = "Key value for passwd storing into secret."
  type = string
  default = ""
}

variable "databaseKey" {
  description = "Key value for database storing into secret."
  type = string
  default = ""
}

variable "hostValue" {
  description = " value for host storing into secret."
  type = string
  default = ""
}

variable "usernameValue" {
  description = " value for username storing into secret."
  type = string
  default = ""
}


variable "passwdValue" {
  description = "value for passwd storing into secret."
  type = string
  default = ""
}


variable "dbValue" {
  description = "value for db storing into secret."
  type = string
  default = ""
}


variable "redis_storage_class" {
  description = "Key value for host storing into secret."
  type = string
  default = ""
}

variable "nextcloud_helm_release" {
  description = "Nextcloud helm release"
  type = string
  default = ""
}

variable "nextcloud_helm_repo" {
  description = "Nextcloud helm repo."
  type = string
  default = ""
}

variable "nextcloud_chart" {
  description = "Nextcloud chart."
  type = string
  default = ""
}

variable "nextcloud_helm_version" {
    description = "Nextcloud helm version."
    type = string
    default = ""
}