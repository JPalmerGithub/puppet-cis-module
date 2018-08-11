# Configure /etc/cron.monthly permissions
class cis::cis_benchmarks::r516 {

  file { '/etc/cron.monthly':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0700'
  }

}
