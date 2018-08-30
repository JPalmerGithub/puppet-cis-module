# 4.2.4 Ensure restricted permissions in /var/log
class cis::cis_benchmarks::r424 {

  exec { 'varlog_permissions':
    command => '/bin/find /var/log -type f -exec chmod g-wx,o-rwx {} +',
  }

}
