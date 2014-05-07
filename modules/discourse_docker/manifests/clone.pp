# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at http://mozilla.org/MPL/2.0/.

# Clones the Discourse Docker repository
class discourse_docker::clone {
  # Ensure git is installed
  include git

  # clone repo
  git::repo {'discourse_docker':
    path   => '/var/docker',
    source => 'https://github.com/discourse/discourse_docker.git'
  }
}
