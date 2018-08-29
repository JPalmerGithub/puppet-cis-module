# Single User Mode Authentication
class cis::cis_benchmarks::r142 {

  file_line { 'enable_single_user_auth':
    line => 'SINGLE=/sbin/sulogin',
    path => "/etc/sysconfig/init",
    match => '^SINGLE=',
    replace => true,
  }

}
