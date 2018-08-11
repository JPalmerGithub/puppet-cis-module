# Ensure permissions on /etc/passwd- are configured
class cis::cis_benchmarks::r616 {

  file { '/etc/passwd-':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  }

}
