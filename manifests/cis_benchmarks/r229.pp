# Disable FTP server
class cis::cis_benchmarks::r229 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-vsftpd':
    command => 'chkconfig vsftpd off',
    onlyif => 'chkconfig --list | grep vsftpd | grep on'
  }

}
