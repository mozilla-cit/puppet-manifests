# Contains Puppet's runstages
class runstages {
  stage { 'prep': before => Stage['main']}
  stage { 'post': require => Stage['main']}
}
