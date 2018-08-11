# Ensure permissions on /etc/gshadow- are configured
class cis::cis_benchmarks::r619 {

  file { '/etc/gshadow-':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  }

}
