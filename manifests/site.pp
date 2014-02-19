class base {
  include runstages
  include users
  include sudo
}


node 'csa-bastion2' {
	class { 'base': production => $production }
	realize Users::Account['tad']
}