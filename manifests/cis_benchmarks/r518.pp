# Restrict at/cron
class cis::cis_benchmarks::r518 {

  $remove_files = [ '/etc/cron.deny', '/etc/at.deny' ]

  file { $remove_files :
    ensure => absent
  }

  $create_files = [ '/etc/cron.allow', '/etc/at.allow' ]

  file { $create_files :
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600',
    require => File[$remove_files]
  }


}
