# Class: accounts::virtual
#
# A class to put virtual user account resources
#
# Parameters:
#
# Actions:
#
# Requires:
#
# Sample Usage:
#   @accounts::account { 'bob':
#     ensure => present,
#     comment => 'Silent Bob',
#     uid => 1000,
#     gid => 1000,
#     groups => ['wheel'],
#     home => '/home/bob',
#     managehome => true,
#     shell => '/bin/bash',
#     password => $private::params::password_hash_bob,
#   }
#
#   # This will create an account with uid and gid 1001
#   @accounts::account { 'jay':
#     uid => 1001,
#   }
#
#   @accounts::account { 'dante':
#     ensure => absent,
#   }
#
#   Accounts::Account <| title == 'bob' |>
#   Accounts::Account <| title == 'jay' |>
#   Accounts::Account <| title == 'dante' |>
#
# [Remember: No empty lines between comments and class definition]
class accounts::virtual {
  # Add @accounts:account virtual resources here
     @accounts::account { 'test':
     ensure => present,
     comment => 'Silent Bob',
     uid => 1013,
     gid => 1013,
     groups => ['sudo'],
     home => '/home/test',
     managehome => true,
     shell => '/bin/bash',
     password => '$6$7pe0INu/$Uxsn.lb/mJjd9394DIJx5JS9a1NVhrpWDpXRtPGS78/BfyShhOf1G0ft7mRHspXDZo6.ezyqpqIXHQ8Tl8ZJt0',
   }
}
