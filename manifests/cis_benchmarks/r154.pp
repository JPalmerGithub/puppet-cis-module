# Restore Binaries and Disable Prelink
class cis::cis_benchmarks::r154 {

  Exec {
    path => [ '/usr/sbin', '/usr/bin', '/bin' ],
    user => 'root'
  }

  package { 'prelink':
    ensure => absent,
  }

}
