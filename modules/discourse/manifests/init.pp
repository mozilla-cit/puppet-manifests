class discourse {
  include base
  include nginx
  include redis
  #  include postgres
  $discoursepackages = [ 'build-essentials', 'libssl-dev','libyaml-dev',  'git', 'libtools', 'libxslt-dev', 'libpq-dev', 'gawk', 'curl', 'pngcrush', 'imagemagick', 'python-software-properties' ]
  package { $discoursepackages:
    ensure => 'latest'
  }
}



