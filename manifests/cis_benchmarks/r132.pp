# Cron Filesystem Check
class cis::cis_benchmarks::r132 {

  cron { 'run-filesystem-check':
    ensure => present,
    command => '/usr/sbin/aide --check',
    user  => 'root',
    hour => 5,
    minute => 0
  }

}
