# Configure /etc/cron.weekly permissions
class cis::cis_benchmarks::r515 {

  file { '/etc/cron.weekly':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0700'
  }

}
