class base {
  class { 'runstages': stage => prep }
  include users
  include sudo
}


node 'csa-bastion2' {
	class { 'base': stage => prep }
	realize Users::Account['tad']
}