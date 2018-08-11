# Restore Binaries and Disable Prelink
class cis::cis_benchmarks::r154 {

  Exec {
    path => [ '/usr/sbin', '/usr/bin', '/bin' ],
    user => 'root'
  }

  package { 'prelink':
    ensure => installed
  }

  exec { 'restore-binaries':
    command => 'prelink -ua',
    require => Package['prelink'],
    notify => Exec['remove-prelink']
  }

  exec { 'remove-prelink':
    command => 'yum remove -y prelink',
    onlyif => 'rpm -q prelink',
    refreshonly => true
  }

}
