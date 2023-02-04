provider "google" {
  project = "${var.project}"
}

module "network" {
  source = "terraform-google-modules/network/google"
  name= "${var.network_name}"
  auto_create_subnetworks = true
}

module "db" {
  source = "terraform-google-modules/sql/google"
  name = "${var.db_name}"
  database_instance_id = "${var.db_instance}"
  region = "${var.region}"
  disk_size = "${var.db_disk_size}"
  disk_type = "${var.db_disk_type}"
  database_version = "${var.db_version}"

  networks = [
    module.network.network,
  ]
}

module "app" {
  source = "terraform-google-modules/compute-instance/google"

  name= "${var.app_name}"
  machine_type = "${var.app_machine_type}"
  boot_disk = [
    {
      initialize_params = [
        {
          image = "${var.image}"
        },
      ],
    },
  ]

  network_interface = [
    {
      network = module.network.network.self_link,
      access_config = [
        {
          type = "ONE_TO_ONE_NAT",
        },
      ],
    },
  ]

  metadata = {
    environment = "${var.environment}"
  }
}

module "lb" {
  source = "terraform-google-modules/load-balancer/google"

  name            = "${var.loadblancer_name}"
  backend_service = [module.app.instance_group_manager.self_link]
  network         = module.network.network.self_link
}

variable "project" {
  type = string }
  
variable "network_name" {
  type = string}
  
variable "db_name" {
  type = string}
  
variable "db_instance" {
  type = string}
  
variable "db_disk_size" {
  type = number}

variable "db_disk_type" {
  type = string}

variable "db_version" {
  type = string}

variable "app_name" {
  type = string}

variable "app_machine_type" {
  type = string}

variable "image" {
  type = string}

variable "loadblancer_name" {
  type = string}
  
variable "environment"
