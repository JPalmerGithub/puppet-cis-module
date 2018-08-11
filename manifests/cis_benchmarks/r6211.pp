# Ensure no users have .forward files
class cis::cis_benchmarks::r6211 {

  file { '/opt/cis/disable_dotforward.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/disable_dotforward.sh',
    notify => Exec['run-dotforward-check'] 
  }

  exec { 'run-dotforward-check':
    command => '/bin/bash /opt/cis/disable_dotforward.sh',
    user => 'root',
    require => File['/opt/cis/disable_dotforward.sh'],
    refreshonly => true
  }

}
