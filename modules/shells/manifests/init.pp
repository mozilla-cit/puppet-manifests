class shells {

  package { 'zsh':
    ensure => latest
  }

  package { 'tcsh':
    ensure => latest
  }

}
