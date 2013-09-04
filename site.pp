#Make sure sudoers is has the right owner/mode
file { "/etc/sudoers":
	owner => root, group => root, mode => 400
}
#Purge existing Puppet firewall rules
resources { "firewall":
  purge => true
}

#Make sure pre/post classes are run in the right order
Firewall {
  before  => Class['firewall::post'],
  require => Class['firewall::pre'],
}
#Define pre/post classes
class { ['firewall::pre', 'firewall::post']: }

#Make sure correct packages are installed
class { 'firewall': }

