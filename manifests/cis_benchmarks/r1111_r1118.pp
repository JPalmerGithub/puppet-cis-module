# Disable filesystems
class cis::cis_benchmarks::r1111_r1118 {

  $cis_file = "/etc/modprobe.d/CIS.conf"

  file { $cis_file :
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0644'
  }

  Exec {
    user => 'root',
    path => [ '/usr/sbin/', '/bin/', 'sbin' ]
  }

  # 1.1.1.1 Disable cramfs filesystem

  exec { 'disable-cramfs':
    command => "echo install cramfs /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v cramfs | grep "install /bin/true" && lsmod | grep cramfs',
    unless => 'modprobe -n -v cramfs | grep "install /bin/true"',
  } 

  # 1.1.1.2 Disable freexvfs filesystem

  exec { 'disable-freexvfs':
    command => "echo install freevxfs /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v freevxfs | grep "install /bin/true" && lsmod | grep freevxfs',
    unless => 'modprobe -n -v freevxfs | grep "install /bin/true"',
  } 

  # 1.1.1.3 Disable jffs2 filesystem

  exec { 'disable-jffs2':
    command => "echo install jffs2 /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v jffs2 | grep "install /bin/true" && lsmod | grep jffs2',
    unless => 'modprobe -n -v jffs2 | grep "install /bin/true"',
  } 

  # 1.1.1.4 Disable hfs filesystem

  exec { 'disable-hfs':
    command => "echo install hfs /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v hfs | grep "install /bin/true" && lsmod | grep hfs',
    unless => 'modprobe -n -v hfs | grep "install /bin/true"',
  } 

  # 1.1.1.5 Disable hfsplus filesystem

  exec { 'disable-hfsplus':
    command => "echo install hfsplus /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v hfsplus | grep "install /bin/true" && lsmod | grep hfsplus',
    unless => 'modprobe -n -v hfsplus | grep "install /bin/true"',
  } 

  # 1.1.1.6 Disable squashfs filesystem

  exec { 'disable-squashfs':
    command => "echo install squashfs /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v squashfs | grep "install /bin/true" && lsmod | grep squashfs',
    unless => 'modprobe -n -v squashfs | grep "install /bin/true"',
  } 

  # 1.1.1.7 Disable udf filesystem

  exec { 'disable-udf':
    command => "echo install udf /bin/true >> ${cis_file}",
    #unless => 'modprobe -n -v udf | grep "install /bin/true" && lsmod | grep udf',
    unless => 'modprobe -n -v udf | grep "install /bin/true"',
  } 

  # 1.1.1.8 Disable vfat filesystem

  exec { 'disable-vfat':
    command => "echo install vfat /bin/true >> ${cis_file}",
    unless => "grep 'install vfat /bin/true' ${cis_file}",
  }

  # 3.5.1 disable DCCP
 
  exec { 'disable-dccp':
    command => "echo install dccp /bin/true >> ${cis_file}",
    unless => 'modprobe -n -v dccp | grep "install /bin/true"',
  }

  # 3.5.4 disable TIPC
  exec { 'disable-tipc':
    command => "echo install tipc /bin/true >> ${cis_file}",
    unless => 'modprobe -n -v tipc | grep "install /bin/true"',
  }

  # 3.5.2
  exec { 'disable-sctp':
    command => "echo install sctp /bin/true >> ${cis_file}",
    unless => 'modprobe -n -v sctp | grep "install /bin/true"',
  }

  # 3.5.3
  exec { 'disable-rds':
    command => "echo install rds /bin/true >> ${cis_file}",
    unless => 'modprobe -n -v rds | grep "install /bin/true"',
  }

  # 3.3.3 Disable IPv6

  file_line { 'disable_ipv6':
    line => 'options ipv6 disable=1',
    path => "$cis_file",
    match => '^options ipv6 disable',
    replace => true,
    require => File[$cis_file],
  }

}
