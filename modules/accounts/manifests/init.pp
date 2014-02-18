# Class: accounts
#
# This module manages real user accounts and groups.
# This module doesn't do anything by default.
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
#   # This with create an account with uid and gid 1001
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
class accounts {
  # Users can be put in local manifests or accounts::virtual
  include accounts::virtual
}
