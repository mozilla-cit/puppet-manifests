include runstages
class base {
	include stdlib
	include sudo
	include users
	include motd
	include hosts
	realize Users::Account['tad']
	realize Users::Account['will']
	realize Users::Account['mrz']
}
node 'csa-bastion1' {
	class { 'base' : stage => prep }

}

node 'csa-bastion2' {
	class { 'base' : stage => prep }
	class { 'monitoring-agent' : stage => post }
	class { 'docker' : stage => post }

}

node 'csa-discourse-web1' {
	class { 'base' : stage => prep }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}