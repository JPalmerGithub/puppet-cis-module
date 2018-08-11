# Ensure password fields are not empty
class cis::cis_benchmarks::r621 {

  file { '/opt/cis':
    ensure => directory,
    mode => '0750',
    owner => 'root',
    group => 'root'
  }

  file { '/opt/cis/lock_users_with_empty_passwords.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/lock_users_with_empty_passwords.sh',
    require => File['/opt/cis'],
    notify => Exec['lock-users']
  }

  exec { 'lock-users':
    command => '/bin/bash /opt/cis/lock_users_with_empty_passwords.sh',
    user => 'root',
    require => File['/opt/cis/lock_users_with_empty_passwords.sh'],
    refreshonly => true
  }

}
