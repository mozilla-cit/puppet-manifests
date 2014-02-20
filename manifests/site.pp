include runstages
class base {
	include stdlib
	include users
	realize Users::Account['tad']
	realize Users::Account['will']
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }

}