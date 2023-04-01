resource "google_compute_target_pool" "target_pool" {
    provider = google-beta
	region = var.region
	name = var.target_pool_name
}


resource "google_compute_autoscaler" "asg" {
    provider = google-beta
    depends_on = [
        google_sql_database_instance.instance,
    ]
	zone = var.zone
	name = var.asg_name
	target = google_compute_instance_group_manager.asg_instance.id
	autoscaling_policy {
		max_replicas = var.max_replicas
		min_replicas = var.min_replicas
		cooldown_period = var.asg_cooldown
	cpu_utilization {
		target = var.cpu_target
		}
	}
}


resource "google_compute_instance_group_manager" "asg_instance" {
    provider = google-beta
	zone = var.zone
	name = var.instance_manager
	version {
		instance_template = google_compute_instance_template.instance_template.id
		name = "primary"
	}
	target_pools = [google_compute_target_pool.target_pool.self_link]
		base_instance_name = "base_name"
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
    yum install httpd wget unzip epel-release mysql -y
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
    yum -y install https://dl.fedoraproject.org/pub/epel/epel-next-release-latest-9.noarch.rpm
    yum -y install yum-utils
    yum-config-manager --enable remi-php56   [Install PHP 5.6]
    yum -y install php php-mcrypt php-cli php-gd php-curl php-mysql php-ldap php-zip php-fileinfo
    wget https://wordpress.org/latest.tar.gz
    tar -xf latest.tar.gz -C /var/www/html/
    mv /var/www/html/wordpress/* /var/www/html/
    cp /var/www/html/wp-config-sample.php /var/www/html/wp-config.php
    chmod 666 /var/www/html/wp-config.php
    sed 's/'database_name_here'/'${google_sql_database.database.name}'/g' /var/www/html/wp-config.php -i
    sed 's/'username_here'/'${google_sql_user.users.name}'/g' /var/www/html/wp-config.php -i
    sed 's/'password_here'/'${var.db_password}'/g' /var/www/html/wp-config.php -i
    sed 's/'localhost'/'${google_sql_database_instance.instance.ip_address.0.ip_address}'/g' /var/www/html/wp-config.php -i
    sed 's/SELINUX=permissive/SELINUX=enforcing/g' /etc/sysconfig/selinux -i
    getenforce
    setenforce 0
    chown -R apache:apache /var/www/html/
    systemctl start httpd
    systemctl enable httpd
    SCRIPT   
    

	disk {
		source_image = data.google_compute_image.centos_7.self_link
	}
	network_interface {
		network = "google_compute_network.vpc.id"
		access_config {
		}
	}
}

data "google_compute_image" "centos_7" {
  provider = google-beta
  family  = "centos-7"
  project = "centos-cloud"
}
