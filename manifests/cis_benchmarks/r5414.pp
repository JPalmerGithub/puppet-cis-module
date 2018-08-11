# Ensure inactive password lock is 30 days or less
class cis::cis_benchmarks::r5414 {

  file { '/etc/default/useradd':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600',
    source => 'puppet:///modules/cis/user_accounts/useradd'
  }

}
