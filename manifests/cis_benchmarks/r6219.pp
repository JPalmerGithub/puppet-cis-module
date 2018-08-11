# Ensure no duplicate group names exist
class cis::cis_benchmarks::r6219 {

  file { '/opt/cis/ensure_no_duplicate_groupname.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_no_duplicate_groupname.sh',
    notify => Exec['run-groupname-duplicate-check'] 
  }

  exec { 'run-groupname-duplicate-check':
    command => '/bin/bash /opt/cis/ensure_no_duplicate_groupname.sh',
    user => 'root',
    require => File['/opt/cis/ensure_no_duplicate_groupname.sh'],
    refreshonly => true
  }

}
