# Ensure no duplicate UIDs exist
class cis::cis_benchmarks::r6216 {

  file { '/opt/cis/ensure_no_duplicate_uids.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_no_duplicate_uids.sh',
    notify => Exec['run-uid-duplicate-check'] 
  }

  exec { 'run-uid-duplicate-check':
    command => '/bin/bash /opt/cis/ensure_no_duplicate_uids.sh',
    user => 'root',
    require => File['/opt/cis/ensure_no_duplicate_uids.sh'],
    refreshonly => true
  }

}
