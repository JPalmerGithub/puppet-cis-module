# Ensure all groups in /etc/passwd exist in /etc/group
class cis::cis_benchmarks::r6215 {

  file { '/opt/cis/ensure_same_group.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_same_group.sh',
    notify => Exec['run-same-group-check'] 
  }

  exec { 'run-same-group-check':
    command => '/bin/bash /opt/cis/ensure_same_group.sh',
    user => 'root',
    require => File['/opt/cis/ensure_same_group.sh'],
    refreshonly => true
  }

}
