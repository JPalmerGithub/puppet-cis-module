# Ensure no users have .netrc files
class cis::cis_benchmarks::r6212 {

  file { '/opt/cis/disable_netrc.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/disable_netrc.sh',
    notify => Exec['run-netrc-check'] 
  }

  exec { 'run-netrc-check':
    command => '/bin/bash /opt/cis/disable_netrc.sh',
    user => 'root',
    require => File['/opt/cis/disable_netrc.sh'],
    refreshonly => true
  }

}
