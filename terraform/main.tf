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

module "rds_instance" {
    source = "./modules/rds_instance" 
}

module "rds_secret" {
  source = "./modules/secrets_deployment"

  depends_on = [ module.rds_instance ]

  db_endpoint = module.rds_instance.rds_endpoint
  db_user = module.rds_instance.rds_user
  db_password = module.rds_instance.rds_password
  db_database_name = module.rds_instance.rds_db_name
}

module "eso_user" {
  source = "./modules/tf_deployment_ESO_user"
  depends_on = [ module.rds_secret ]
  secrets_name = module.rds_secret.secrets_name
}

module "route53_access" {
  source = "./modules/route53_access"
}

module "s3_access" {
  source = "./modules/s3_access"
}

module "ebs_volume1" {
  source = "./modules/ebs_volume"
}

module "ebs_volume2" {
  source = "./modules/ebs_volume"
}




