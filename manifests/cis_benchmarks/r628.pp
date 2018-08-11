# Ensure users' home directories permissions are 750 or more restrictive
class cis::cis_benchmarks::r628 {

  file { '/opt/cis/ensure_homedir_permission.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_homedir_permission.sh',
    notify => Exec['run-homedir-permission-check']
  }

  exec { 'run-homedir-permission-check':
    command => '/bin/bash /opt/cis/ensure_homedir_permission.sh',
    user => 'root',
    require => File['/opt/cis/ensure_homedir_permission.sh'],
    refreshonly => true
  }

}
