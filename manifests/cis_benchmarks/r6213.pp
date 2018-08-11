# Ensure users' .netrc Files are not group or world accessible
class cis::cis_benchmarks::r6213 {

  file { '/opt/cis/ensure_netrc_permissions.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_netrc_permissions.sh',
    notify => Exec['run-netrc-permission-check'] 
  }

  exec { 'run-netrc-permission-check':
    command => '/bin/bash /opt/cis/ensure_netrc_permissions.sh',
    user => 'root',
    require => File['/opt/cis/ensure_netrc_permissions.sh'],
    refreshonly => true
  }

}
