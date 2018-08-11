# Enable rsyslog
class cis::cis_benchmarks::r4211 {

  package { 'rsyslog':
    ensure => installed
  }

  service { 'rsyslog':
    ensure => running,
    enable => true,
    require => Package['rsyslog']
  }

}
