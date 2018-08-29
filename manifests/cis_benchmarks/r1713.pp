class cis::cis_benchmarks::r1713 {

  file { '/etc/issue.net':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    content => '',
  }

}
