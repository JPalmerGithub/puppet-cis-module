# Set permission of /etc/hosts.deny
class cis::cis_benchmarks::r345 {

  file { '/etc/hosts.deny':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

}
