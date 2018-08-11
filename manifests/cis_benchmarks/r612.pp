# Ensure permissions on /etc/passwd are configured
class cis::cis_benchmarks::r612 {

  file { '/etc/passwd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

}
