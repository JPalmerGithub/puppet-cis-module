# Configure /etc/crontab permissions
class cis::cis_benchmarks::r512 {

  file { '/etc/crontab':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  }

}
