# Set Bootloader Permissions
class cis::cis_benchmarks::r141 {

  exec {"change_permission_menu_dot_list":
    command => '/bin/chmod 0600 /boot/grub/menu.lst',
    onlyif => '/usr/bin/test -e /boot/grub/menu.lst',
  }

  exec { 'grub_cfg_ownership':
    command => '/bin/chown root:root /boot/grub2/grub.cfg',
    onlyif => '/bin/test ! $(/bin/stat -c %U%G /boot/grub2/grub.cfg) = rootroot',
  }
  
  exec { 'grub_cfg_permission':
    command => '/bin/chmod 600 /boot/grub2/grub.cfg',
    onlyif => '/bin/test ! $(/bin/stat -c %a /boot/grub2/grub.cfg) = 600',
  }


}
