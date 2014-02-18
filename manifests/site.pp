class base {
  include runstages
  class { 'users': stage => prep }
  include sudo
}


node 'csa-bastion2' {
	class { 'base': production => $production }
	realize Users::Account['tad']
}