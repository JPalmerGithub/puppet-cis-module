# Disable dhcp
class cis::cis_benchmarks::r225 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-dhcpd':
    command => 'chkconfig dhcpd off',
    onlyif => 'chkconfig --list | grep dhcpd | grep on'
  }

}
