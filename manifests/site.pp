class base {
  include runstages
  include users
  include sudo
}


node 'ubuntu-12' {
	include base
	realize Users::Account['tad']
}