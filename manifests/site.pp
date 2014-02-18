class base {
  include runstages
  class { 'users': stage => prep }
  include sudo
}


node 'csa-bastion2' {
	include base
	realize Users::Account['tad']
}