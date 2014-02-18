node 'csa-bastion2' {
  include ::sudo
  include users
  realize Users::Account['tad']
}