# VM configuration

vm-count = "1"
vm-name = "terraformdomo" # 생성될 vm의 이름

vm-template-name = "terraform_test"
vm-cpu = "2"
vm-ram = "4096"
vm-disk = "50"
vm-firmware = "bios" # 부팅 모드 efi or bios

# vm-guest-id = "ubuntu 20.05"
vm-guest-id = "ubuntu64Guest"

vsphere-unverified-ssl = "true"
vsphere-datacenter = "" # vsphere에서 FQDN 하위의 데이터센터의 이름
vsphere-cluster = "" # 데이터센터에서 사용하고있는 클러스터
vm-datastore = "" # 저장소
vm-network = "" # 생성될 인스턴스의 세그먼트