# Contains the local host for Puppet
class hosts::local {
  host { 'csa-puppet1':
    ip           => '10.0.0.7',
    host_aliases => 'puppet',
  }
}
