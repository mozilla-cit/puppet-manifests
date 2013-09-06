#################################################
# SSHD Install pp file
#################################################
class ssh::install {
  package { $ssh::params::ssh_package_name:
    ensure => present,
  }
}
