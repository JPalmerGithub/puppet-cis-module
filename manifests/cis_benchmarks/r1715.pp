# Permission of /etc/issue
class cis::cis_benchmarks::r1715 {

  file { '/etc/issue':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/motd'
  }

}
