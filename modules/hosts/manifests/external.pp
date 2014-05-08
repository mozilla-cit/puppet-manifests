# Contains the external IP for Puppet
class hosts::external {
  host { 'csa-puppet1':
    ip           => '15.125.78.134',
    host_aliases => 'puppet',
  }
}
