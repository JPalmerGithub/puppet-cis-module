# Ensure users own their home directories
class cis::cis_benchmarks::r629 {

  file { '/opt/cis/ensure_user_dir.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_user_dir.sh',
    notify => Exec['run-userdir-ownership-check'] 
  }

  exec { 'run-userdir-ownership-check':
    command => '/bin/bash /opt/cis/ensure_user_dir.sh',
    user => 'root',
    require => File['/opt/cis/ensure_user_dir.sh'],
    refreshonly => true
  }

}
