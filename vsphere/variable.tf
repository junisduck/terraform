# vCenter connection
variable "vsphere-user" {
  type = string
  description = "vCenter/vSphere 계정"
}

variable "vsphere-password" {
  type = string
  description = "vCenter/vSphere 비밀번호"
}

variable "vsphere-vcenter" {
  type = string
  description = "vCenter/vSphere 서버 FQDN // IP"
  default = ""
}
variable "vsphere-unverified-ssl" {
  type = string
  description = "자체 인증 ssl 사용 여부 (true/false) // true"
}

variable "vsphere-datacenter" {
  type = string
  description = "VMWare vCenter/vSphere 이름"
}

variable "vsphere-cluster" {
  type = string
  description = "VMWare vSphere cluster 이름"
}

variable "vsphere-template-folder" {
  type = string
  description = "Template folder 이름"
  default = "ZBS"
}



# virtual machine
variable "vm-count" {
  type = string
  description = "생성 할 VM 개수"
}

variable "vm-datastore" {
  type = string
  description = "VMWare vSphere datastore 이름"
}

variable "vm-network" {
  type = string
  description = "VMWare vSphere Network 이름"
}

variable "vm-cpu" {
  type = string
  description = "가상머신 cpu 개수"
}

variable "vm-ram" {
  type = string
  description = "가상머신 memory 사이즈"
}

variable "vm-disk" {
  type = string
  description = "가상머신 disk 사이즈"
  default = "30"
}

variable "vm-name" {
  type = string
  description = "가상머신 이름"
}

variable "vm-firmware" {
  type = string
  description = "efi / bios"
  default = "bios"
}

variable "vm-guest-id" {
  type = string
  description = "가상머신 OS명"
}

variable "vm-template-name" {
  type = string
  description = "가상머신을 배포할 템플릿 이름"
}