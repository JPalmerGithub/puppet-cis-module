# Disable SNMP Server
class cis::cis_benchmarks::r2214 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-snmpd':
    command => 'chkconfig snmpd off',
    onlyif => 'chkconfig --list | grep snmpd | grep on'
  }

}
