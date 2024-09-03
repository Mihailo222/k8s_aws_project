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

locals {
  module1_vars = file("modules/rds_instance/terraform.tfvars")
  module2_vars = file("modules/secrets_deployment/terraform.tfvars")
  module3_vars = file("modules/tf_deployment_ESO_user/terraform.tfvars")
  module4_vars = file("modules/route53_access/terraform.tfvars")
  module5_vars = file("modules/s3_access/terraform.tfvars")
  module6_vars = file("modules/ebs_volume/terraform.tfvars")
  module7_vars = file("modules/nextcloud_custom/terraform.tfvars")
  module8_vars = file("modules/nginx_controller/terraform.tfvars")
  module9_vars = file("modules/ingress/terraform.tfvars")
  module10_vars = file("modules/s3_access_service_account/terraform.tfvars")
  module11_vars = file("modules/route53_access_service_account/terraform.tfvars")
  module12_vars = file("modules/ec2_access/terraform.tfvars")
  module13_vars = file("modules/persistant_volume_claim_one/terraform.tfvars")
  module14_vars = file("modules/ESO_provisioning/terraform.tfvars")
  module15_vars = file("modules/aws_ESO_user_k8s_secret/terraform.tfvars")
  module16_vars = file("modules/secret_store_deployment/terraform.tfvars")
  module17_vars = file("modules/external-secret-deployment/terraform.tfvars")

}



#---------------------------------------------------------------------- MODULES -----------------------------------------------------------------------------------------------------------------
module "rds_instance" {

    source = "./modules/rds_instance"
    variables_from_tfvars = local.module1_vars
}

module "rds_secret" {

  source = "./modules/secrets_deployment"

  depends_on = [ module.rds_instance ]

  db_endpoint = module.rds_instance.rds_endpoint
  db_user = module.rds_instance.rds_user
  db_password = module.rds_instance.rds_password
  db_database_name = module.rds_instance.rds_db_name

  variables_from_tfvars = local.module2_vars
}

module "eso_user" {

  source = "./modules/tf_deployment_ESO_user"
  depends_on = [ module.rds_secret ]
  secrets_name = module.rds_secret.secrets_name
  
  variables_from_tfvars = local.module3_vars


}

module "route53_access" {

  source = "./modules/route53_access"
  variable_from_tfvars = local.module4_vars
}

module "s3_access" {

  source = "./modules/s3_access"
  variable_from_tfvars = local.module5_vars
}

module "ebs_volume1" {

  source = "./modules/ebs_volume"
  variables_from_tfvars = local.module6_vars
}

module "ebs_volume2" {

  source = "./modules/ebs_volume"
  variables_from_tfvars = local.module6_vars
}

module "nextcloud" {
  source = "./modules/nextcloud_custom" 
  variable_from_tfvars = local.module7_vars
}

// ingress controller deployment
module "ingress-controller" {
  source = "./modules/nginx_controller"
  variable_from_tfvars = local.module8_vars
}

// ingress deployment
module "ingress-deployment" {
  source = "./modules/ingress"
  depends_on = [ module.nextcloud ]
  service_name = module.nextcloud.nextcloud_release_name

  variable_from_tfvars = local.module9_vars
}

//access s3 service account deployment
module "s3_access_service_acc" {

  source = "./modules/s3_access_service_account"
  depends_on = [ module.s3_access ]
  s3_access_role_name = module.s3_access.role_name

  variables_from_tfvars = local.module10_vars
}

//access route53 service account deployment
module "r53_access_service_acc" {

  source = "./modules/route53_access_service_account"
  depends_on = [ module.route53_access ]
  r53_access_role_name = module.route53_access.route53_access_role_name

  variables_from_tfvars = local.module11_vars

}

//import ebs csi driver 

//add EC2 Access Polict to EKS Nodes group: 
module "ec2_access_policy" {
source = "./modules/ec2_access"  
variables_from_tfvars = local.module12_vars
}

//deploy persistant volumes
module "pvc1" {

  source = "./modules/persistant_volume_claim_one"
  depends_on = [ module.ebs_volume1 ]
  volume_handle = module.ebs_volume1.volume_id
  name = "ebs-pv1"

  variables_from_tfvars = local.module13_vars
}

module "pvc2" {
  
  source = "./modules/persistant_volume_claim_one"
  depends_on = [ module.ebs_volume2 ]
  volume_handle = module.ebs_volume2.volume_id
  name = "ebs-pv2"
  variables_from_tfvars = local.module13_vars
}

//deploy ESO
module "ESO_deployment" {

  source = "./modules/ESO_provisioning"
  variables_from_tfvars = local.module14_vars
}

//deploy ESO user
module "aws_ESO_user_secret" {

  source = "./modules/aws_ESO_user_k8s_secret"
  depends_on = [ module.eso_user ]
  user_access_key = module.eso_user.access_key_id
  user_secret_access_key = module.eso_user.secret_access_key

  variables_from_tfvars = local.module15_vars

}

//secrets store
module "secrets_store" {

  source = "./modules/secret_store_deployment"
  depends_on = [ module.aws_ESO_user_secret ]
  access_key = module.aws_ESO_user_secret.access_key_key
  secret_access_key = module.aws_ESO_user_secret.secret_access_key_key
  aws_auth_secret = module.aws_ESO_user_secret.secrets_name
  variables_from_tfvars = local.module16_vars

}

//external secret
module "external-secret" {

  source = "./modules/external-secret-deployment"

  depends_on_one = [ module.secrets_store ]
  depends_on_two = [ module.rds_secret ]

 secret_store_name = module.secrets_store.secret_store_name
 secret_manager_secret_name = module.rds_secret.secrets_name

variables_from_tfvars = local.module17_vars
 
 }
