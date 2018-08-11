# Configure rsyslog default file permissions
class cis::cis_benchmarks::r4213 {

  file { '/etc/rsyslog.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/syslog/rsyslog.conf',
    notify => Service['rsyslog']
  }

}
