# Disable Samba
class cis::cis_benchmarks::r2212 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-smb':
    command => 'chkconfig smb off',
    onlyif => 'chkconfig --list | grep smb | grep on'
  }

}
