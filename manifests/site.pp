include runstages
class base {
	include stdlib
	include sudo
	include users
	include motd
	include hosts
	include git
	realize Users::Account['tad']
	realize Users::Account['will']
	realize Users::Account['mrz']
}
node 'csa-bastion1' {
	class { 'base' : stage => prep }
	class { 'hosts::local' : stage => prep }
	realize Users::Account['yousef']
	realize Users::Account['logan']
	realize Users::Account['tanner']

}

node 'csa-bastion2' {


}

node 'csa-discourse-web1' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker::update' : stage           => prep }
    class { 'docker::install' : stage          => main }
    class { 'discourse_docker::clone' : stage  => post }
    class { 'discourse_docker::production' : stage => post }
    class { 'discourse_docker::setup' : stage  => post }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}

node 'csa-discourse-web2' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker::update' : stage           => prep }
    class { 'docker::install' : stage          => main }
    class { 'discourse_docker::clone' : stage  => post }
    class { 'discourse_docker::production' : stage => post }
    class { 'discourse_docker::setup' : stage  => post }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}

node 'csa-discourse-dev' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker::update' : stage           => prep }
	class { 'docker::install' : stage          => main }
	class { 'discourse_docker::clone' : stage  => post }
	class { 'discourse_docker::dev' : stage => post }
	class { 'discourse_docker::setup' : stage  => post }
	realize Users::Account['tanner']
	realize Users::Account['yousef']
	realize Users::Account['logan']
}

node 'csa-docker-registry' {
	class { 'base' : stage                     => prep }
	class { 'hosts::external' : stage          => prep }
	class { 'monitoring-agent' : stage         => prep }
	class { 'monitoring-agent::config' : stage => post }
	class { 'docker::update' : stage           => prep }
	class { 'docker::install' : stage          => main }
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


node 'csa-puppet1' {
	class { 'base' : stage => prep }
	realize Users::Account['logan']
	realize Users::Account['tanner']
	realize Users::Account['yousef']
}
