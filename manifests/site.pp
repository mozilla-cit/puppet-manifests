node 'csa-bastion2' {
  include ::sudo
  include Accounts
  Accounts::Account <| title == 'test' |>
}