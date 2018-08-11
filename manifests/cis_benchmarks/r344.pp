# Set permission of /etc/hosts.allow 
class cis::cis_benchmarks::r344 {

  file { '/etc/hosts.allow':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

}
