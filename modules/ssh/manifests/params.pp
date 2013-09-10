# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.
class ssh::params {
  $ssh_package_name = 'openssh-server'
  $ssh_service_conf = '/etc/ssh/sshd_config'
  $ssh_service_name = 'ssh'
  $ssh_dir          = '/etc/ssh'

  $ssh_port         = 22
  $ssh_addr_family  = 'any'
  $ssh_listen_addr  = '0.0.0.0'
  $ssh_protocol     = 2

  $ssh_hostkey      = $ssh_dir + '/ssh_host_rsa_key'
  $ssh_key_regen_interval = '1h'
  $ssh_server_key_bits    = 1024

  $ssh_syslog_facility    = 'AUTHPRIV'
  $ssh_syslog_level       = 'INFO'
  $ssh_login_grace_time   = '2m'
  $ssh_permit_root        = 'no'
  $ssh_strict_mode        = 'yes'
  $ssh_max_auth_tries     = 6

  $ssh_rsa_auth           = 'yes'
  $ssh_pubkey_auth        = 'yes'
  $ssh_auth_keysfile      = '.ssh/authorized_keys'
  $ssh_auth_keyscmd       = 'none'
  $ssh_auth_keyscmdrunas  = 'nobody'

  $ssh_rhosts_rsa_auth    = 'no'
  $ssh_hostbased_auth     = 'no'

  $ssh_ignoreusrknown     = 'no'
  $ssh_ignorerhosts       = 'yes'
  $ssh_pwd_auth           = 'no'
  $ssh_permit_empty_pwd   = 'no'
  $ssh_challenge_resp     = 'no'

  $ssh_kerb_auth          = 'no'
  $ssh_kerb_or_localpw    = 'no'
  $ssh_kerb_ticket_clean  = 'yes'
  $ssh_kerb_get_afs       = 'no'
  $ssh_kerb_use_kuserok   = 'yes'
  $ssh_gssapi_auth        = 'yes'
  $ssh_gssapi_cleanupcred = 'yes'
  $ssh_gssapi_strictacpt  = 'yes'
  $ssh_gssapi_key_exch    = 'no'

  $ssh_use_pam            = 'yes'

  $ssh_accept_env         = 'LANG LC_CTYPE LC_NUMERIC LC_TIME'
  $ssh_accept_env         +=' LC_COLLATE LC_MONETARY LC_MESSAGES'
  $ssh_accept_env         +=' LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE'
  $ssh_accept_env         +=' LC_MEASUREMENT LC_IDENTIFICATION LC_ALL'
  $ssh_accept_env         +=' LANGUAGE XMODIFIERS'

  $ssh_allow_agent_fwrd   = 'yes'
  $ssh_allow_tcp_fwrd     = 'yes'
  $ssh_gatewayports       = 'no'
  $ssh_X11_forward        = 'yes'
  $ssh_X11_displayoffset  = 10
  $ssh_X11_uselocalhost   = 'yes'
  $ssh_printmotd          = 'yes'
  $ssh_print_lastlog      = 'yes'
  $ssh_tcp_keepalive      = 'yes'
  $ssh_use_login          = 'no'
  $ssh_use_priv_sep       = 'yes'
  $ssh_permit_user_env    = 'no'
  $ssh_compress           = 'delay'
  $ssh_client_alive_int   = 0
  $ssh_client_alive_cnt   = 3
  $ssh_show_patch_lvl     = 'no'
  $ssh_use_dns            = 'yes'
  $ssh_pid_file           = '/var/run/sshd.pid'
  $ssh_max_startups       = 10
  $ssh_permit_tunnel      = 'no'
  $ssh_chroot_dir         = 'none'

  $ssh_banner             = 'none'
}
