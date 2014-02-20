include runstages
class base {
  include stdlib
  include users
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }
	realize Users::Account['tad']
}