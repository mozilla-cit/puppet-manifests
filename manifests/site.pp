class base {
  include runstages
  include users
  include sudo
}


node 'csa-bastion2' {
	include base
	realize Users::Account['tad']
}