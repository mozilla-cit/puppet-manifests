# Configures the monitoring agent
class monitoring_agent::config {
  file { '/etc/xinetd.d/check_mk':
    mode   => '0400',
    owner  => root,
    group  => root,
    source => 'puppet:///modules/monitoring_agent/check_mk',
  }
}
