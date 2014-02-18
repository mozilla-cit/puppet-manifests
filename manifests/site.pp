node 'csa-bastion2' {
  include ::sudo
  include accounts
  class { 'accounts::account': title=>'test' }
}