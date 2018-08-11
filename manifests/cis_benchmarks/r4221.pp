# Enable rsyslog
class cis::cis_benchmarks::r4221 {

  package { 'syslog-ng':
    ensure => installed
  }

  service { 'syslog-ng':
    ensure => running,
    enable => true,
    require => Package['syslog-ng']
  }

}
