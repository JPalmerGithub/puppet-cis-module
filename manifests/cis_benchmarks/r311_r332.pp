# Update sysctl.conf for Network Parameters (Host only, Host and Router), IPv6
class cis::cis_benchmarks::r311_r332 {

  file { '/etc/sysctl.conf':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644',
    source => 'puppet:///modules/cis/sysctl.conf',
    notify => Exec['load-sysctl']
  }

  exec { 'load-sysctl':
    command => '/sbin/sysctl -e -p',
    user => 'root',
    require => File['/etc/sysctl.conf'],
    refreshonly => true
  }

}
