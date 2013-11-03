#Set up dependencies for Discourse
class discourse {
  #Set up package array
  $discoursepackages = [ 'build-essentials', 'libssl-dev','libyaml-dev', 'git',
  'libtools', 'libxslt-dev', 'libpq-dev', 'gawk', 'curl', 'pngcrush',
  'imagemagick', 'python-software-properties' ]
  include base
  include nginx
  include redis
  #  include postgres
  package { $discoursepackages:
    ensure  => 'latest'
  }
  git::repo{'discourse':
    path    => '/var/www/', #Placeholder location for now
    source  => 'git://github.com/discourse/discourse.git',
    git_tag => 'latest-release'
  }
}



