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
	class { 'hosts::local' : stage => prep }

}

node 'csa-bastion2' {


}

node 'csa-discourse-web1' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker' : stage                   => prep }
    class { 'discourse-docker' : stage       => prep }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}

node 'csa-discourse-web2' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker' : stage                   => prep }
    class { 'discourse-docker" : stage      => prep }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}

node 'csa-wpmu-web1' {
	class { 'base' : stage => prep }
	class { 'monitoring-agent' : stage => prep }
	class { 'hosts::local' : stage => prep }
	realize Users::Account['logan']
}

node 'csa-wpmu-web2' {
	class { 'base' : stage => prep }
	class { 'monitoring-agent' : stage => prep }
	realize Users::Account['logan']
	class { 'hosts::local' : stage => prep }
}
