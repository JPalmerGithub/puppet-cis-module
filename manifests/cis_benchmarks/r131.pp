# Install AIDE
class cis::cis_benchmarks::r131 {

  package { 'aide':
    ensure => installed
  }

  Exec {
    path => [ '/usr/bin', '/usr/sbin', '/bin' ],
    user => 'root'
  }

  exec { 'aide-init':
    command => 'aide --init',
    require => Package['aide'],
    unless => 'test -f /var/lib/aide/aide.db.gz',
    notify => Exec['move-db-files']
  }

  exec { 'move-db-files':
    command => 'mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz',
    unless => 'test -f /var/lib/aide/aide.db.gz',
    refreshonly => true
  }

}
