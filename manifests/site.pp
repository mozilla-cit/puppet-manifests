node 'csa-bastion2' {
  include ::sudo
  Accounts::Account <| title == 'dante' |>
}