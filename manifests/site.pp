class 'base' {
  include runstages
  include users
  include sudo
}


node 'csa-bastion2' {
	class { 'base' }
}