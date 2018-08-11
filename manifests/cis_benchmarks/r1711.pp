# MOTD
class cis::cis_benchmarks::r1711 {

  file { '/etc/motd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/motd'
  }

}
