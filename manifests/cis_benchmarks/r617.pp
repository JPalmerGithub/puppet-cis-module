# Ensure permissions on /etc/shadow- are configured
class cis::cis_benchmarks::r617 {

  file { '/etc/shadow-':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  }

}
