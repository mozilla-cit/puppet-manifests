# Available variables:
# $uid,$realname,$pass,$sshkeytype,$sshkey,$shell,$locked


@accounts::virtual { 'ubuntu':
uid => 1000,
realname => 'Ubuntu',
require => Class['accounts::config'],
locked => true,
shell => "/bin/zsh"
}

@accounts::virtual { 'tad':
uid => 1000,
realname => 'Tom Farrow',
require => Class['accounts::config'],
locked => false,
shell => "/bin/zsh"
sshkey => "AAAAB3NzaC1yc2EAAAADAQABAAABAQC+CplsmiLlLzv432y5FD4vQugqsE65pTCcqRIledrLgtsHrLyG8A/aeUhN+lYMSyRZF1yvJgYzxHCct5bDide78G46mFG0al1U082+tSPAnkexP/DKFCDuVZSeuuvpD4W+zxxdhPTGoshcoMw7862m5vstMUCcJoSBXrqBZ2zmnmKWM0HoNGuPjQDrebaUd6fNKcGT5YfSB+ItJAN3wGNdLNG3GzN7NN7xhmH59GaAfPXYzRBq5Oees0c87qHphTiHzUzKP1X9sY39aqy6wGccNjhK2g6Jee2LYSyUcQL8C5gEsag3aA3PAj4hzM/9DyjiIsD79p/IukAnL/woJS8V tom@mozilla.org.uk",
sshkeytype => ssh_rsa,
}