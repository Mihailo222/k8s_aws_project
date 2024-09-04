terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.64.0"
    } 
  }

   backend "s3" {
        bucket="tfstatemihailo"
        key="terraform.state.file" 
        region = "eu-central-1" 
      
    }
}

provider "aws" {
   region="eu-central-1"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

provider "helm" {
  kubernetes {
    config_path = "~/.kube/config"
  }  
}
#---------------------------------------------------------------------- MODULES -----------------------------------------------------------------------------------------------------------------
module "rds_instance" {

    source = "./modules/rds_instance"
    subnet_group_name = var.subnet_group_name
    subnet_one = var.subnet_one
    subnet_two = var.subnet_two
    vpc = var.vpc
    db_name = var.db_name
    db_username = var.db_username
    db_passwd = var.db_passwd
    eks_sg1 = var.eks_sg1
    eks_sg2 = var.eks_sg2
    db_sg_name = var.db_sg_name
    engine = var.engine
    engine_version = var.engine_version
    instance_class = var.instance_class
    allocated_storage = var.allocated_storage
}

module "rds_secret" {

  source = "./modules/secrets_deployment"

  depends_on = [ module.rds_instance ]

  db_endpoint = module.rds_instance.rds_endpoint
  db_user = module.rds_instance.rds_user
  db_password = module.rds_instance.rds_password
  db_database_name = module.rds_instance.rds_db_name
  secret_name = var.secrets_name
  secret_description = var.secret_description

 
}

module "eso_user" {

  source = "./modules/tf_deployment_ESO_user"
  depends_on = [ module.rds_secret ]
  secrets_name_ESO = module.rds_secret.secrets_name
  
  username_for_secrets_reader_user = var.username_for_secrets_reader_user
  user_policy_name = var.user_policy_name
  region = var.region
  account_id = var.account_id
}

module "route53_access" {

  source = "./modules/route53_access"
  region = var.region
  cluster_oidc_id = var.cluster_oidc_id
  namespace_r53 = var.namespace_r53
  service_account_name_r53 = var.service_account_name_r53
  iam_role_name = var.iam_role_name
  academy_zone_id = var.academy_zone_id
  account_id = var.account_id
}

module "s3_access" {

  source = "./modules/s3_access"
  region_s3 = var.region_s3
  cluster_oidc_id = var.cluster_oidc_id
  namespace_s3 = var.namespace_s3
  service_account_name_s3 = var.service_account_name_s3
  account_id = var.account_id
  bucket_name = var.bucket_name
  access_role4_s3_bucket = var.access_role4_s3_bucket

}

module "ebs_volume1" {

  source = "./modules/ebs_volume"
  ebs_size = var.ebs_size
  az = var.az
}



module "ebs_volume2" {

  source = "./modules/ebs_volume"
  ebs_size = var.ebs_size
  az = var.az

}

module "nextcloud" {
  source = "./modules/nextcloud_chart"
  
  helm_release = var.nextcloud_helm_release
  helm_repository = var.nextcloud_helm_repo
  chart = var.nextcloud_chart
  version_nextcloud = var.nextcloud_helm_version


  bucket_name = var.bucket_name
  nextcloud_username = var.nextcloud_username
  nextcloud_password = var.nextcloud_password
  db_secret_name = var.new-secret

  hostKey = var.hostKey
  usernameKey = var.usernameKey
  passwdKey = var.passwdKey
  databaseKey = var.databaseKey

  hostValue = var.hostValue
  usernameValue = var.usernameValue
  passwdValue = var.passwdValue
  dbValue = var.dbValue
  redis_storage_class = var.redis_storage_class

}


module "ingress-controller" {
  source = "./modules/nginx_controller"
  name = var.name
  repository = var.repository
  chart = var.chart
  namespace = var.namespace
}


module "ingress-deployment" {

  source = "./modules/ingress"
  depends_on = [ module.nextcloud ]
  service_name = module.nextcloud.nextcloud_release_name
  name_ing = var.name_ing
  namespace_ing = var.namespace_ing
  ingress_class_name = var.ingress_class_name
  host = var.host
  path = var.path
  service_port = var.service_port
}


module "s3_access_service_acc" {

  source = "./modules/s3_access_service_account"
  depends_on = [ module.s3_access ]
  s3_access_role_name = module.s3_access.role_name


}


module "r53_access_service_acc" {

  source = "./modules/route53_access_service_account"
  depends_on = [ module.route53_access ]
  r53_access_role_name = module.route53_access.route53_access_role_name
  service_account_name = var.service_account_name
  service_account_namespace = var.service_account_namespace
  user_id = var.user_id
}

//import ebs csi driver 


module "ec2_access_policy" {
source = "./modules/ec2_access"
eks_node_group_role = var.eks_node_group_role
account_id = var.account_id
}


module "pvc1" {

  source = "./modules/persistant_volume_claim_one"
  depends_on = [ module.ebs_volume1 ]
  volume_handle = module.ebs_volume1.volume_id
  pv_name = "ebs-pv1"
  access_mode = var.access_mode
  storage = var.storage
  driver = var.driver
  storage_class_name = var.storage_class_name
  persistent_volume_reclaim_policy = var.persistent_volume_reclaim_policy
}

module "pvc2" {
  
  source = "./modules/persistant_volume_claim_one"
  depends_on = [ module.ebs_volume2 ]
  volume_handle = module.ebs_volume2.volume_id
  pv_name = "ebs-pv2"
  access_mode = var.access_mode
  storage = var.storage
  driver = var.driver
  storage_class_name = var.storage_class_name
  persistent_volume_reclaim_policy = var.persistent_volume_reclaim_policy

}



module "ESO_deployment" {

  source = "./modules/ESO_provisioning"
  helm_repo_name = var.helm_repo_name
  helm_release_name = var.helm_release_name
  helm_release_chart = var.helm_release_chart

}

module "aws_ESO_user_secret" {

  source = "./modules/aws_ESO_user_k8s_secret"
  depends_on = [ module.eso_user ]
  user_access_key = module.eso_user.access_key_id
  user_secret_access_key = module.eso_user.secret_access_key
  secrets_name = var.secrets_name
  access_key_key = var.access_key_key
  secret_access_key_key = var.secret_access_key_key
}

#requires ESO helmchart installed on k8s cluster
module "secrets_store" {

  source = "./modules/secret_store_deployment"
  depends_on = [ module.aws_ESO_user_secret ]
  access_key = module.aws_ESO_user_secret.access_key_key
  secret_access_key = module.aws_ESO_user_secret.secret_access_key_key
  aws_auth_secret = module.aws_ESO_user_secret.secrets_name
  region = var.region
  secret_store_name = var.secret_store_name
  secret_store_namespace = var.secret_store_namespace
 }

module "external-secret" {

  source = "./modules/external-secret-deployment"

  depends_on_one = [ module.secrets_store ]
  depends_on_two = [ module.rds_secret ]

  secret_store_name = module.secrets_store.secret_store_name
  secret_manager_secret_name = module.rds_secret.secrets_name

  external_secret_name = var.external_secret_name
  new-secret = var.new-secret

  external_secret_namespace = var.external_secret_namespace
}