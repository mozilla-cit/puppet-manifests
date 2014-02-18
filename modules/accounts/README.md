# Accounts #

A Puppet module for managing real user accounts and groups.

The Puppet built-in type 'user' isn't very good at managing real
user accounts. This module defines the accounts::account type that
takes the same parameters as 'user'.

accounts::account creates a user group *before* the user account. This allows groups to be created with a specific gid number.

## Usage ##

Add virtual resources to accounts::virtual or to your own classes.

Provide full details:

    @accounts::account { 'bob':
      ensure => present,
      comment => 'Silent Bob',
      uid => 1000,
      gid => 1000,
      groups => ['wheel'],
      home => '/home/bob',
      managehome => true,
      shell => '/bin/bash',
      password => $private::params::password_hash_bob,
    }

Or let the defaults take care of everything.
This will create an account with uid and gid 1001:

    @accounts::account { 'jay':
      uid => 1001,
    }

Remove an account:

    @accounts::account { 'dante':
      ensure => absent,
    }

Realize the resources:

    Accounts::Account <| title == 'bob' |>
    Accounts::Account <| title == 'jay' |>
    Accounts::Account <| title == 'dante' |>

## Author ##

* Anton Cohen <anton@antoncohen.com>
* [Source](https://github.com/antoncohen/puppet-accounts)
* [Homepage](http://www.antoncohen.com/)
* [@antoncohen](http://twitter.com/antoncohen)
