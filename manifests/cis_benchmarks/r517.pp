# Configure /etc/cron.d permissions
class cis::cis_benchmarks::r517 {

  file { '/etc/cron.d':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0700'
  }

}
