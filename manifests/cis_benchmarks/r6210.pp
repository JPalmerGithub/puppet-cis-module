# Ensure users' dot files are not group or world writable
class cis::cis_benchmarks::r6210 {

  file { '/opt/cis/ensure_dotfiles_permission.sh':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0755',
    source => 'puppet:///modules/cis/user_accounts/ensure_dotfiles_permission.sh',
    notify => Exec['run-dotfiles-permission-check'] 
  }

  exec { 'run-dotfiles-permission-check':
    command => '/bin/bash /opt/cis/ensure_dotfiles_permission.sh',
    user => 'root',
    require => File['/opt/cis/ensure_dotfiles_permission.sh'],
    refreshonly => true
  }

}
