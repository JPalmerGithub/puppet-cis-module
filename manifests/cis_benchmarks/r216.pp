# Disable rsh
class cis::cis_benchmarks::r216 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-rexec':
    command => 'chkconfig rexec off',
    onlyif => 'chkconfig --list | grep rexec | grep on'
  }

  exec { 'disable-rlogin':
    command => 'chkconfig rlogin off',
    onlyif => 'chkconfig --list | grep rlogin | grep on'
  }

  exec { 'disable-rsh':
    command => 'chkconfig rsh off',
    onlyif => 'chkconfig --list | grep rsh | grep on'
  }

}
