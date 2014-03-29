include runstages
class base {
	include stdlib
	include users
	include motd
	include hosts
	include sudo
	realize Users::Account['tad']
	realize Users::Account['will']
	realize Users::Account['mrz']
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }

}
