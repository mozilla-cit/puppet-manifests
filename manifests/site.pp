class base {
  include runstages
  include users
  include sudo
}


node 'csa-bastion2' {
	include runstages
	class { 'base': stage => prep }
	realize Users::Account['tad']
}