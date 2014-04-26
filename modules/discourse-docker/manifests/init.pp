# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Class: discourse-docker
class discourse-docker {
    # Ensure git is installed
    package { "git":
      ensure => installed,
    }

  # clone repo
  exec { "clone discourse-docker repo":
    command => "/usr/bin/git clone https://github.com/discourse/discourse_docker.git /var/docker"
    }

# Copy config
  file { "Docker config":
    source => 'puppet:///modules/discourse-dockerapp.yml',
    path   => '/var/docker/containers/app.yml',
    mode   => 0400,
    owner  => 'root',
    group  => 'docker',
    links   => 'follow'
  }

# Bootstrap app
  exec { "bootstrap Discourse":
    command => '/var/docker/launcher bootstrap app'
  }

# Start app
  exec { "start Discourse":
    command => '/var/docker/launcher start app'
  }
}
