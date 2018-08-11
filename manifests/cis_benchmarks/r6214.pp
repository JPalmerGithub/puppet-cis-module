# Ensure no users have .rhosts files
class cis::cis_benchmarks::r6214 {

  file { '/opt/cis/disable_rhosts.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/disable_rhosts.sh',
    notify => Exec['run-rhosts-check'] 
  }

  exec { 'run-rhosts-check':
    command => '/bin/bash /opt/cis/disable_rhosts.sh',
    user => 'root',
    require => File['/opt/cis/disable_rhosts.sh'],
    refreshonly => true
  }

}
