# Disable Interactive Boot
class cis::cis_benchmarks::r143 {

  file_line { 'disabled_interactive_boot':
    line => 'PROMPT=no',
    path => "/etc/sysconfig/init",
    match => '^PROMPT=',
    replace => true,
  }

}
