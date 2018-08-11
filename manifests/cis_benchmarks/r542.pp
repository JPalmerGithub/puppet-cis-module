# Ensure system accounts are non-login
class cis::cis_benchmarks::r542 {

  file { 'set-non-login':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/set_users_to_non_login.sh',
    path => '/opt/cis/set_users_to_non_login.sh',
    notify => Exec['run-non-login']
  }

  exec { 'run-non-login':
    command => '/bin/bash /opt/cis/set_users_to_non_login.sh',
    user => 'root',
    refreshonly => true,
    require => File['set-non-login']
  }


}
