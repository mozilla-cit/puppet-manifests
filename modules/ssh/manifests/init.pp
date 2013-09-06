#################################################
# SSHD Init pp file
#################################################
class ssh {
  include ssh::params, ssh::install, ssh::config, ssh::service
}
