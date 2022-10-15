terraform {
  backend "s3" {
    bucket         = "terraformstatedaicon"
    key            = "global/s3/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform-state_locking"
    encrypt        = true
  }
}
module "dev_s3_bucket-dynamodb" {
  source = "../../modules/s3_Dynamo_statefile"
}
module "dev_vpc" {
  source = "../../modules/vpc"
}
module "dev_securitygroups" {
  source = "../../modules/securitygroups"
  vpc_id = module.dev_vpc.vpc_id
}
# module "DB_securitygroup" {
#   source      = "../../modules/DB_securitygroup"
#   vpc_id      = module.dev_vpc.vpc_id
# }
module "keypair" {
  source             = "../../modules/key-pair"
  path_to_public_key = var.dev_path_to_public_key
  key_name           = var.dev_key_name
}
module "dev_bashion" {
  source            = "../../modules/bastion"
  Bastion_ami        = var.dev_instance_ami
  securitygroup_id  = module.dev_securitygroups.DocJenSona_sg
  subnet_id         = module.dev_vpc.PUB_SN1
  keyname           = module.keypair.keypair_id
}
module "dev_docker" {
  source            = "../../modules/docker"
  docker_ami        = var.dev_instance_ami
  security_group_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id         = module.dev_vpc.PRV_SN1
  keyname           = module.keypair.keypair_id
  NewRelicLicence   = var.NewRelic_Licence
}
resource "null_resource" "docker_configure" {
  connection {
    type        = "ssh"
    host        = module.dev_docker.Docker_prvIP
    user        = "ec2-user"
    private_key = file("~/keypairs/test-key")
    bastion_host = module.dev_bashion.Bastion_IP
    bastion_user = "ec2-user"
    bastion_private_key = file("~/keypairs/test-key")
  }
  provisioner "file" {
    source      = "~/myproject/Module-EC2-AutoD/modules/docker/docker-compose.yml"
    destination = "/home/ec2-user/docker-compose.yml"
  }
}
module "dev_sonarQube" {
  source           = "../../modules/sonarQube"
  sonarQube_ami    = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PUB_SN2
  keyname          = var.dev_key_name
}
module "dev_ansible" {
  source           = "../../modules/ansible_auto_discovery"
  Ansible_ami      = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PRV_SN1
  keyname          = module.keypair.keypair_id
}

resource "null_resource" "configure" {
  connection {
    type        = "ssh"
    host        = module.dev_ansible.Ansible_prvIP
    user        = "ec2-user"
    private_key = file("~/keypairs/test-key")
    bastion_host = module.dev_bashion.Bastion_IP
    bastion_user = "ec2-user"
    bastion_private_key = file("~/keypairs/test-key")
  }
  provisioner "file" {
    source      = "~/myproject/Module-EC2-AutoD/environments/dev/auto-discovery"
    destination = "/home/ec2-user/auto-discovery"
  }
  provisioner "file" {
    source      = "~/keypairs/test-key"
    destination = "/home/ec2-user/test-key"
  }
}
module "dev_jenkins" {
  source           = "../../modules/jenkins"
  Jenkins_ami      = var.dev_instance_ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id        = module.dev_vpc.PUB_SN1
  keyname          = module.keypair.keypair_name
  NewRelicLicence   = var.NewRelic_Licence
}
module "dev_instance-ami" {
  source      = "../../modules/instance_ami"
  instance_id = module.dev_docker.docker_id
}
module "dev_launch_config" {
  source           = "../../modules/launch_config"
  image_id         = module.dev_instance-ami.instance-ami
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  keyname          = module.keypair.keypair_name
}
module "dev_jenkins_lb" {
  source           = "../../modules/jenkins_loadbalancer"
  subnet_id        = module.dev_vpc.PUB_SN1
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  instance_id      = module.dev_jenkins.Jenkins-lb_id
}
module "dev_loadbalance" {
  source           = "../../modules/loadbalancer"
  securitygroup_id = module.dev_securitygroups.DocJenSona_sg
  subnet_id1       = module.dev_vpc.PUB_SN1
  subnet_id2       = module.dev_vpc.PUB_SN2
  vpc_id           = module.dev_vpc.vpc_id
  target_id        = module.dev_docker.docker_id
}
module "dev_autoscaling" {
  source               = "../../modules/autoscaling"
  instance-asg-lc-name = module.dev_launch_config.instance-asg-lc
  vpc_identifier1      = module.dev_vpc.PUB_SN1
  vpc_identifier2      = module.dev_vpc.PUB_SN2
  lb_target_group_arn  = module.dev_loadbalance.Jencontainer-tg
}
module "dev_route53" {
  source      = "../../modules/route53"
  lb_dns-name = module.dev_loadbalance.JenContainer-lb
  lb_zone_id  = module.dev_loadbalance.JenContainer-lb-zoneID
}


/*
Note: 
1. When applying or planing this code always include '-var-file=secret.tfvars' 
to the terraform apply or terraform plan
use this code "terraform apply --auto-approve  -var-file="secret.tfvars"" to apply the code 
2. When you want to apply this code for the first time, comment out all the code from line 1-9. 
This will allow s3 bucket and dynamodb to be created then uncomment the line and run 
terraform init and then apply the code as instructed in 1 above.
 */
