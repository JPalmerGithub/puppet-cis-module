# Disable automounting
class cis::cis_benchmarks::r1119 {

  exec {'disable-autofs':
    path => [ '/sbin', '/bin' ],
    command => 'chkconfig autofs off',
    user => 'root',
    onlyif => 'chkconfig --list | grep autofs'
  }

}
