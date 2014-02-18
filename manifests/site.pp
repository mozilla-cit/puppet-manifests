node 'csa-bastion2' {
  include ::sudo
  include ::accounts
  Accounts::Account <| title == 'dante' |>
}