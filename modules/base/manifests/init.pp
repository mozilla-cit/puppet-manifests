# The base includes/accounts for Puppet
class base {
  include stdlib
  include sudo
  include users
  include motd
  include hosts
  include git
  include puppet
  realize Users::Account['tad']
  realize Users::Account['will']
  realize Users::Account['mrz']
}
