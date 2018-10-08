# Ensure no world writable files exist
class cis::cis_benchmarks::r6110 {

  file { '/var/log/cis':
    ensure => directory,
    owner => 'root',
    group => 'root',
    mode => '0750'
  }

  exec { 'check-world-writable-files':
    path => [ '/bin', '/usr/bin' ],
    command => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 > /var/log/cis/world_writable_files.log",
    user => 'root',
    onlyif => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -type f -perm -0002 | grep /",
    require => File['/var/log/cis'],
    notify => Exec['check-world-writable-files-result'],
  }

  exec { 'check-world-writable-files-result':
    path => '/bin',
    command => 'echo Check /var/log/cis/world_writable_files.log for world writable files.',
    logoutput => true,
    refreshonly => true,
  }

}
