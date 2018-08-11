# Ensure all users' home directories exist
class cis::cis_benchmarks::r627 {

  file { '/opt/cis/ensure_homedir_exist.sh':
    ensure => file,
    owner  => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_homedir_exist.sh',
    notify => Exec['run-homedir-check']
  }

  exec { 'run-homedir-check':
    command => '/bin/bash /opt/cis/ensure_homedir_exist.sh',
    user => 'root',
    require => File['/opt/cis/ensure_homedir_exist.sh'],
    refreshonly => true
  }

}
