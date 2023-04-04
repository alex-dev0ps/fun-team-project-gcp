resource "google_compute_autoscaler" "asg" {
    provider = google-beta
    depends_on = [
        google_sql_database_instance.instance,
    ]
	zone = var.zone
	name = var.asg_name
	target = google_compute_instance_group_manager.asg_instance.self_link
	autoscaling_policy {
		max_replicas = var.max_replicas
		min_replicas = var.min_replicas
		cooldown_period = var.asg_cooldown
	cpu_utilization {
		target = var.cpu_target
		}
	}
}

resource "google_compute_target_pool" "target_pool" {
    provider = google-beta
	region = var.region
	name = var.target_pool_name
    project = var.project_name    
}

resource "google_compute_instance_group_manager" "asg_instance" {
    provider = google-beta
	zone = var.zone
	name = var.instance_manager
    project = var.project_name
	version {
		instance_template = google_compute_instance_template.instance_template.self_link
		name = "primary"
	}
	target_pools = [google_compute_target_pool.target_pool.self_link]
		base_instance_name = "base-name"
	}


resource "google_compute_instance_template" "instance_template" {
    provider = google-beta
	depends_on = [
        google_sql_database_instance.instance,
    ]
    name = var.template_name
	machine_type = var.template_machine_type
	can_ip_forward = false
    project = var.project_name

  metadata_startup_script = <<SCRIPT
      sudo setenforce 0

      sudo yum install httpd -y 

      sudo systemctl start httpd
      sudo systemctl enable httpd

     sudo  yum install unzip wget -y
      sudo rm -rf /var/www/html/*
      sudo wget https://wordpress.org/latest.zip
      sudo unzip latest.zip
      sudo mv wordpress/* /var/www/html/

      sudo yum install epel-release yum-utils -y
      sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
      sudo yum-config-manager --enable remi-php73
      sudo yum install php php-mysql -y 
      sudo systemctl restart httpd
      sudo php --version

      sudo chown -R apache:apache /var/www/html
      sudo rm -f wp-config.php
    SCRIPT
    

	disk {
		source_image = data.google_compute_image.centos_7.self_link
	}
	network_interface {
		network = google_compute_network.vpc.id
		access_config {
		}
	}
}

data "google_compute_image" "centos_7" {
  provider = google-beta
  family  = "centos-7"
  project = "centos-cloud"
}
