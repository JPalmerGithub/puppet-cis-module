# Disable Interactive Boot
class cis::cis_benchmarks::r143 {

  file_line { 'disabled_interactive_boot':
    line => 'PROMPT=no',
    path => "/etc/sysconfig/init",
    match => '^PROMPT=',
    replace => true,
  }

  exec { 'execstart_rescue':
    command => '/bin/sed -i -e \'s|/usr/sbin/sulogin|/sbin/sulogin|g\' /usr/lib/systemd/system/rescue.service',
    onlyif => '/bin/grep /usr/sbin/sulogin /usr/lib/systemd/system/rescue.service',
  }

  exec { 'execstart_emergency':
    command => '/bin/sed -i -e \'s|/usr/sbin/sulogin|/sbin/sulogin|g\' /usr/lib/systemd/system/emergency.service',
    onlyif => '/bin/grep /usr/sbin/sulogin /usr/lib/systemd/system/emergency.service',
  }

}
