# Ensure no duplicate user names exist
class cis::cis_benchmarks::r6218 {

  file { '/opt/cis/ensure_no_duplicate_username.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_no_duplicate_username.sh',
    notify => Exec['run-username-duplicate-check'] 
  }

  exec { 'run-username-duplicate-check':
    command => '/bin/bash /opt/cis/ensure_no_duplicate_username.sh',
    user => 'root',
    require => File['/opt/cis/ensure_no_duplicate_username.sh'],
    refreshonly => true
  }

}
