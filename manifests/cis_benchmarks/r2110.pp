# Disable rsync
class cis::cis_benchmarks::r2110 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-rsync':
    command => 'chkconfig rsync off',
    onlyif => 'chkconfig --list | grep rsync | grep on'
  }

}
