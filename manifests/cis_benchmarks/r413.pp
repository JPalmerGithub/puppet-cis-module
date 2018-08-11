# Audit processes prior to auditd
class cis::cis_benchmarks::r413 {

  exec { 'enable-auditing':
    path => '/bin',
    command => "sed -i '/^\s*kernel/s/$/ audit=1/' /boot/grub/menu.lst",
    user => 'root',
    unless => 'grep "^\s*kernel" /boot/grub/menu.lst | grep audit=1'
  }

}
