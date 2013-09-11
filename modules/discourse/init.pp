class discourse {
  include base
  include nginx
  include redis
  include postgres
  package { 'build-essential':
    ensure => latest
  }
  package { 'libssl-dev':
    ensure => latest
  }
  package { 'libyaml-dev':
    ensure => latest
  }
  package { 'git':
    ensure => latest
  }
  package { 'libtools':
    ensure => latest
  }
  package { 'libxslt-dev':
    ensure => latest
  }
  package { 'libpq-dev':
    ensure => latest
  }
  package { 'gawk':
    ensure => latest
  }
  package { 'curl':
    ensure => latest
  }
  package { 'pngcrush':
    ensure => latest
  }
  package { 'imagemagick':
    ensure => latest
  }
  package { 'python-software-properties':
    ensure => latest
  }
}


