# Ensure SELinux is not disabled in bootloader
class cis::cis_benchmarks::r1611 {

  Exec {
    path => [ '/bin' ],
  }

  exec { 'enable-enfocing-at-boot':
    command => "sed -i 's/enforcing=0//g' /boot/grub/menu.lst && sed -i 's/selinux=0//g' /boot/grub/menu.lst",
    user => 'root',
    onlyif => 'grep "^\s*kernel" /boot/grub/menu.lst | grep enforcing || grep "^\s*kernel" /boot/grub/menu.lst | grep selinux'
  }

}
