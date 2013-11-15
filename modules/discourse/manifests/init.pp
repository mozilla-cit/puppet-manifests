#Set up dependencies for Discourse
class discourse {
  #Set up package array
  $discoursepackages = [ 'build-essentials', 'libssl-dev','libyaml-dev', 'git',
  'libtools', 'libxslt-dev', 'libpq-dev', 'gawk', 'curl', 'pngcrush',
  'imagemagick', 'python-software-properties' ]
  #  include postgres
  package { $discoursepackages:
    path    => '/var/www/',
    source  => 'git://github.com/discourse/discourse.git',
    git_tag => 'latest-release'
  }
}



