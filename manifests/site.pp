include runstages
class base {
  include stdlib
  include users
  include sudo
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }
	realize Users::Account['tad']
}