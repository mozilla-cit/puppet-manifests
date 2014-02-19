class base {
  class { 'runstages': stage => prep }
  include users
  include sudo
}


node 'csa-bastion2' {
	include base
	realize Users::Account['tad']
}