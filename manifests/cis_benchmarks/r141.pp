# Set Bootloader Permissions
class cis::cis_benchmarks::r141 {

  Exec {
    path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
  }

  exec {"change_permission_menu_dot_list":
    command => 'chmod 0600 /boot/grub/menu.lst',
    onlyif => 'test ! -L /boot/grub/menu.lst',
  }

  exec { 'grub_cfg_ownership':
    command => 'chown root:root /boot/grub2/grub.cfg',
    onlyif => 'test ! $(stat -c %U%G /boot/grub2/grub.cfg) = rootroot',
  }
  
  exec { 'grub_cfg_permission':
    command => 'chmod 600 /boot/grub2/grub.cfg',
    onlyif => 'test ! $(stat -c %a /boot/grub2/grub.cfg) = 600',
  }


}
