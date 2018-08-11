# Disable nfs and rpc
class cis::cis_benchmarks::r227 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-nfs':
    command => 'chkconfig nfs off',
    onlyif => 'chkconfig --list | grep nfs | grep on'
  }

  exec { 'disable-rpcbind':
    command => 'chkconfig rpcbind off',
    onlyif => 'chkconfig --list | grep rpcbind | grep on'
  }

}
