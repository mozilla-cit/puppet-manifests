class 'base' {
  include runstages
  class { 'users::keys': stage => prep }
  include sudo
}


node 'csa-bastion2' {
	class { 'base' }
}