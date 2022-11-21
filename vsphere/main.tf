# connect
provider "vsphere" {
    vsphere_server = var.vsphere-vcenter
    user = var.vsphere-user
    password = var.vsphere-password

    allow_unverified_ssl = var.vsphere-unverified-ssl
}

# working env setting
data "vsphere_datacenter" "datacenter" {
  name = var.vsphere-datacenter
}

# cluster -> vCenter 설정에서만 작동하는 코드 따라서, vsphere_server를 vcenter의 도메인 또는 ip로 설정해줘야함
data "vsphere_compute_cluster" "cluster" {
  name = var.vsphere-cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_datastore" "datastore" {
  name = var.vm-datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name = var.vm-network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}
# datastore(ZBS)에 저장되어있는 template 이름
# 템플릿을 원활하게 사용하려면 vmware tools or open vm tools의 설치가 필요하다.
data "vsphere_virtual_machine" "template" {
  name = "terraform_test"
  #name = "/${var.vsphere-datacenter}/vm/${var.vsphere-template-folder}/${var.vm-template-name}"
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

# [ZBS] iso/ubuntu-20.04.5-desktop-amd64.iso

# create vm
resource "vsphere_virtual_machine" "vm" {
  count = var.vm-count
  name = var.vm-name
  firmware = var.vm-firmware

  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id = data.vsphere_datastore.datastore.id

  num_cpus = var.vm-cpu
  memory = var.vm-ram
  guest_id = var.vm-guest-id

  network_interface {
    network_id = data.vsphere_network.network.id
  }
  disk {
    label = "${var.vm-name}-disk"
    size = var.vm-disk
  }
  # network setting
  # https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = "junhee-test"
        domain = "example.com.test"
      }
      network_interface {
        ipv4_address = "" # 생성될 vm의 ip
        ipv4_netmask = 26
      }
      ipv4_gateway = "" # 생성될 vm의 gw
    }
  }
}