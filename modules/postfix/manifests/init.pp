#Set up Postfix server
class { 'postfix':
#Required to send mail via smtp (Mandrill)
  package { 'cyrus-sasl-plain':
    ensure => 'latest'
  }
  file_line { 'required_postfix_settings':
    path => '/etc/postfix/main.cf',
    line => ['smtp_sasl_auth_enable = yes',
    'smtp_sasl_password_maps = hash:/etc/postfix/sasl/passwd',
    'smtp_sasl_security_options = noanonymous',
    'smtp_use_tls = yes',
    'relayhost = [smtp.mandrillapp.com']
    ensure => 'present'
  }
}
