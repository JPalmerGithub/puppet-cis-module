# Configure /etc/cron.daily permissions
class cis::cis_benchmarks::r514 {

  file { '/etc/cron.daily':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0700'
  }

}
