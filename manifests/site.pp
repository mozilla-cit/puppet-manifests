include runstages
class base {
	include stdlib
	include users
	include motd
	realize Users::Account['passwdtest']
}
node 'csa-bastion2' {
	class { 'base' : stage => prep }

}
