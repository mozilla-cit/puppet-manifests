include runstages
class base {
	include stdlib
	include users
	include motd
	include hosts
	realize Users::Account['tad']
	realize Users::Account['will']
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }

}
