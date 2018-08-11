# Uninstall X Window System
class cis::cis_benchmarks::r222 {

  package { 'xorg-x11*':
    ensure => absent
  }

}
