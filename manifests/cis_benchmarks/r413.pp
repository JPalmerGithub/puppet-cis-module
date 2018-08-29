# Audit processes prior to auditd
class cis::cis_benchmarks::r413 {

  file_line { 'enable_audit_before_auditd':
    line => 'GRUB_CMDLINE_LINUX="audit=1 console=tty0 crashkernel=auto console=ttyS0,115200"',
    path => "/etc/default/grub",
    match => '^GRUB_CMDLINE_LINUX=',
    replace => true,
    ensure   => present,
    notify => Exec['apply_new_grub_conf'],
  } 

  exec { 'apply_new_grub_conf':
    command => '/sbin/grub2-mkconfig > /boot/grub2/grub.cfg',
    refreshonly =>true,
  }  

}
