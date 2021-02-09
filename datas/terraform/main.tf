##################################
# NETWORKS
##################################
module "website_network" {
  source = "./modules/aws_network"
  common_tags = {
    Terraform   = "true"
    Environment = var.environment
  }

  # AWS SERVICES : VPC
  cidr_block = "10.0.0.0/16"
  vpc_tags = {
    Name = "grimordal-vpc"
  }

  # AWS SERVICES : INTERNET GATEWAY
  igw_tags = {
    Name = "grimordal-igw"
  }

  # AWS SERVICES : ROUTES TABLES
  public_route_table_tags = {
    Name = "public"
  }

  private_route_table_tags = {
    Name = "private"
  }

  # AWS SERVICES : NAT EIP
  nat_eip_tags = {
    Name = "nat-eip"
  }

  # AWS SERVICES : NAT GATEWAY
  nat_gateway_tags = {
    Name = "nat-gateway"
  }

  # AWS SERVICES : SUBNETS
  # Voir pour les tags des sous-réseaux
  public_subnet_cidr = "10.0.101.0/24"
  public_subnet_tags = {
    Name = "public"
  }

  private_subnet_cidr = "10.0.1.0/24"
  private_subnet_tags = {
    Name = "private"
  }

  availability_zone = var.aws_availability_zone

}

##################################
# SECURITY GROUPS
##################################
module "sg_database" {
  source = "./modules/aws_sg"

  # SECURITY GROUP
  sg_name        = "mysql"
  sg_description = "Allow trafic for MySQL"
  vpc_id         = module.website_network.vpc_id

  # SECURITY GROUP RULES
  ingress = [
    {
      description = "MYSQL Port"
      from_port   = var.db_port
      to_port     = var.db_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

module "sg_web" {
  source = "./modules/aws_sg"

  # SECURITY GROUP
  sg_name        = "web"
  sg_description = "Allow http, https and ssh"
  vpc_id         = module.website_network.vpc_id

  # SECURITY GROUP RULES
  ingress = [
    {
      description = "HTTPS from VPC"
      from_port   = var.https_port
      to_port     = var.https_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "HTTP from VPC"
      from_port   = var.http_port
      to_port     = var.http_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description = "SSH from VPC"
      from_port   = var.ssh_port
      to_port     = var.ssh_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }
  ]
  egress = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

module "sg_memcached" {
  source = "./modules/aws_sg"

  # SECURITY GROUP
  sg_name        = "memcached"
  sg_description = "Allow trafic for MemCached"
  vpc_id         = module.website_network.vpc_id

  # SECURITY GROUP RULES
  ingress = [
    {
      description = "MemCached Port"
      from_port   = var.memcached_port
      to_port     = var.memcached_port
      protocol    = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
  ]
  egress = [
    {
      description = "All outbound traffic"
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    }
  ]

}

##################################
# DATABASE
##################################
module "website_rds" {
  source = "./modules/aws_rds"
  common_tags = {
    Terraform   = "true"
    Environment = var.environment
  }

  # INSTANCE
  instance_deletion_protection = true          # Optional
  instance_engine              = "mysql"       # Required
  instance_engine_version      = "5.7"         # Optional
  instance_instance_class      = "db.t2.micro" # Required
  instance_identifier          = var.db_name   # Optional
  instance_allocated_storage   = 20            # Required

  instance_name     = var.db_name               # Optional
  instance_username = var.db_username           # Required
  instance_password = var.db_password           # Required
  instance_port     = format("%s", var.db_port) # Optional

  instance_tags = {
    Name = "grimordal-db"
  }

  instance_vpc_security_group_ids = [format("%s", module.sg_database.id)]

  instance_maintenance_window      = "Mon:00:00-Mon:03:00"
  instance_backup_window           = "03:00-06:00"
  instance_backup_retention_period = 30

  # DB SUBNET GROUP
  db_subnet_group_name        = "grimordal-db-subnet-group"
  db_subnet_group_description = "Managed by Terraform"
  db_subnet_group_subnet_ids  = [format("%s", module.website_network.private_subnet_id)]
  db_subnet_group_tags = {
    Name = "grimordal-db-subnet-group"
  }

}

##################################
# MEMCACHED
##################################
module "website_memcached" {
  source = "./modules/aws_memcached"

  # PARAMETER GROUP
  parameter_group_name        = "grimordal-parameter-group" # Required unless replication_group_id is provided
  parameter_group_family      = "memcached1.5"              # Required
  parameter_group_description = "Managed by Terraform"      # Optional
  max_item_size               = 10485760                    # Required

  # CLUSTER
  cluster_id         = "grimordal-memcached"                  # Required
  engine             = "memcached"                            # Required unless replication_group_id is provided
  engine_version     = "1.5.16"                               # Optional
  maintenance_window = "mon:03:00-mon:04:00"                  # Optional
  node_type          = "cache.m4.large"                       # Required
  num_cache_nodes    = 1                                      # Required unless replication_group_id is provided
  security_group_ids = [format("%s", module.sg_memcached.id)] # Required unless replication_group_id is provided 
  port               = var.memcached_port
  availability_zone  = var.aws_availability_zone
  az_mode            = "single-az"
  cluster_tags = {
    Name = "grimordal-memcached-cluster"
  }

  # ECACHE SUBNET GROUP
  ecache_subnet_group_name        = "memcached-subnet-group"
  ecache_subnet_group_description = "private memcached subnet group"
  ecache_subnet_group_subnet_ids  = [format("%s", module.website_network.private_subnet_id)]
}

##################################
# S3
##################################
module "website_s3" {
  source = "./modules/aws_s3"

  bucket = "grimordal_cdn_bucket"
  acl    = "public-read"
}

##################################
# CLOUDFRONT
##################################
module "website_cloudfront" {
  source = "./modules/aws_cloudfront"

  # Required
  enabled      = true

  # Optional
  aliases             = null
  comment             = "Grimordal CloudFront"
  default_root_object = null
  http_version        = "http2"
  is_ipv6_enabled     = false
  price_class         = "PriceClass_All"
  retain_on_delete    = false
  wait_for_deployment = false
  web_acl_id          = null
  tags                = null

  # Required
  origin = {
    s3_bucket = {
      domain_name = module.website_s3.s3_bucket_regional_domain_name
    }
  }

  # Required
  default_cache_behavior = {
    target_origin_id       = module.website_s3.s3_bucket_id
    viewer_protocol_policy = "allow-all"

    allowed_methods = ["DELETE", "GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT"]
    cached_methods  = ["GET", "HEAD"]
    compress        = true
    query_string    = true

    min_ttl     = 0
    default_ttl = 3600
    max_ttl     = 86400
  }

  # Required
  viewer_certificate = {
    cloudfront_default_certificate = true
  }

}

##################################
# INSTANCES > NODES
##################################
module "website_ec2" {
  source = "./modules/aws_ec2"
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }

  # KEY PAIR
  kp_key_name = "privatekey"

  # EC2 INSTANCE
  ami                    = "ami-089cc16f7f08c4457"
  instance_type          = "t2.micro" # Required
  key_name               = module.website_ec2.key_pair_kp_name
  monitoring             = true
  vpc_security_group_ids = [format("%s", module.sg_web.id)]
  subnet_id              = module.website_network.private_subnet_id

  public_ip = module.website_network.nat_eip_public_ip

}

##################################
# INSTANCES > NOD MANAGER
##################################
module "website_node_manager" {
  source = "./modules/aws_ec2"
  tags = {
    Terraform   = "true"
    Environment = var.environment
  }

  # KEY PAIR
  kp_key_name = "privatekey"

  # EC2 INSTANCE
  ami                    = "ami-089cc16f7f08c4457"
  instance_type          = "t2.micro" # Required
  key_name               = module.website_ec2.key_pair_kp_name
  monitoring             = true
  vpc_security_group_ids = [format("%s", module.sg_web.id)]
  subnet_id              = module.website_network.private_subnet_id
  public_ip              = module.website_network.nat_eip_public_ip

  # SCRIPTS
  script_source      = "./ansible-node-manager.sh"
  script_destination = "/tmp/ansible-node-manager.sh"

  inline = [
    "chmod +x /tmp/ansible-node-manager.sh",
    "tmp/script.sg args",
    "ansible-playbook -i '${module.website_ec2.public_ip}', -u ec2-user --private-key ./'${module.website_ec2.key_pair_kp_name}'.pem ../wordpress-ansible/master.yml"
  ]

}

##################################
# ROUTE 53
##################################
module "website_route53" {
  source = "./modules/aws_route53"

  zone_name = "grimordal.com"
  records = [
    {
      name = "grimordal.net" # Name of domain
      type = "A"             # "A" for IPv4 Address
      alias = {
        name    = module.website_elb.name
        zone_id = module.website_elb.zone_id
      }
    },
    # Pas besoin
    {
      name = "cloudfront"
      type = "A" # "A" for IPv4 Address
      alias = {
        name    = module.website_cloudfront.cloudfront_distribution_domain_name    #"d-10qxlbvagl.execute-api.eu-west-1.amazonaws.com"
        zone_id = module.website_cloudfront.cloudfront_distribution_hosted_zone_id # "ZLY8HYME6SFAD"
      }
    }
  ]
}

##################################
# LOAD BALANCER
##################################
module "website_elb" {
  source = "./modules/aws_elb"
  tags = {
    Environment = var.environment
  }

  name            = "grimordal-elb"
  subnets         = [format("%s", module.website_network.public_subnet_id)]
  security_groups = [format("%s", module.sg_web.id)]
  internal        = false

  listener = [
    {
      instance_port     = "80"
      instance_protocol = "HTTP"
      lb_port           = "80"
      lb_protocol       = "HTTP"
    },
    {
      instance_port     = "443"
      instance_protocol = "HTTPS"
      lb_port           = "443"
      lb_protocol       = "HTTPS"
    },
    {
      instance_port     = "22"
      instance_protocol = "SSL"
      lb_port           = "22"
      lb_protocol       = "SSL"
    },
  ]

  health_check = {
    target              = "HTTP:80/"
    interval            = 30
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 5
  }

  access_logs = {
    bucket = module.website_s3.s3_bucket_id
  }

}
