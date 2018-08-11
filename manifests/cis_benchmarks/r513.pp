# Configure /etc/cron.hourly permissions
class cis::cis_benchmarks::r513 {

  file { '/etc/cron.hourly':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0700'
  }

}
