resource "google_compute_target_pool" "target_pool" {
	region = var.region
	name = var.target_pool_name
}


resource "google_compute_autoscaler" "asg" {
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
	zone = var.zone
	name = var.instance_manager
	version {
		instance_template = google_compute_instance_template.asg_instance.id
		name = "primary"
	}
	target_pools = [google_compute_target_pool.asg_instance.self_link]
		base_instance_name = ""
	}


resource "google_compute_instance_template" "instance_template" {
	name = var.template_name
	machine_type = var.template_machine_type
	can_ip_forward = false
    
	disk {
		source_image = var.source_image
	}
	network_interface {
		network = "google_compute_network.vpc.id"
		access_config {
		}
	}
}

