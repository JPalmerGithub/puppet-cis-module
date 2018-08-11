# Ensure no duplicate GIDs exist
class cis::cis_benchmarks::r6217 {

  file { '/opt/cis/ensure_no_duplicate_gids.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_no_duplicate_gids.sh',
    notify => Exec['run-gid-duplicate-check'] 
  }

  exec { 'run-gid-duplicate-check':
    command => '/bin/bash /opt/cis/ensure_no_duplicate_gids.sh',
    user => 'root',
    require => File['/opt/cis/ensure_no_duplicate_gids.sh'],
    refreshonly => true
  }

}
