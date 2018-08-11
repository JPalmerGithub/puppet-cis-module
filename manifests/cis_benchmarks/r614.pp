# Ensure permissions on /etc/group are configured
class cis::cis_benchmarks::r614 {

  file { '/etc/group':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

}
