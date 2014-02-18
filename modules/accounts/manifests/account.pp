# Definition: accounts::account
#
# Creates user and group for real (non-system) users.
# Tries to have good defaults.
#
# Parameters: Same as 'user' type
#
# Actions: Creates or removes user and group
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
define accounts::account(
  $title='test',
  $name='something',
  $ensure=present,
  $comment=undef,
  $uid=undef,
  $gid=$uid,
  $groups=undef,
  $home=undef,
  $managehome=true,
  $shell='/bin/bash',
  $password=undef) {

  user { "$name":
    ensure => $ensure,
    comment => $comment,
    uid => $uid,
    gid => $gid,
    groups => $groups,
    home => $home,
    managehome => $managehome,
    shell => $shell,
    password => $password,
    require => Group["$name"],
  }

  group { "$name":
    ensure => $ensure,
    gid => $gid ? {
      /[0-9]+/ => $gid,
      default => undef,
    }
  }
}
