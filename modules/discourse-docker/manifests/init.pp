# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Class: discourse-docker

#Set up run stages
stage { 'first'
  before => stage['main']
  }
stage { 'last' : }
Stage['main'] -> Stage['last']

  # Ensure git is installed
  package { "git"
    stage  => 'first',
    ensure => installed,
  }

# clone repo
exec { "clone discourse-docker repo":
  stage   => 'first',
  command => "git clone https://github.com/discourse/discourse_docker.git /var/docker"
  }

# Copy config
file { "Docker config":
  stage  => 'first',
  source => 'puppet:///modules/discourse-docker/files/app.yml',
  path   => '/var/docker/containers/app.yml',
  mode   => 0400,
  owner  => 'root',
  group  => 'docker'
}

# Bootstrap app
exec { "bootstrap Discourse":
  command => '/var/docker/discourse_docker/launcher bootstrap app'
}

# Start app
exec { "start Discourse":
  command => '/var/docker/discourse_docker/launcher start app'
}
