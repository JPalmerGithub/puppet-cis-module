# Ensure permissions on /etc/gshadow are configured
class cis::cis_benchmarks::r615 {

  file { '/etc/gshadow':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0000'
  }

}
