# Set Bootloader Permissions
class cis::cis_benchmarks::r141 {

  exec {"change_permission_menu_dot_list":
    command => '/bin/chmod 0600 /boot/grub/menu.lst',
    onlyif => '/usr/bin/test -e /boot/grub/menu.lst',
  }

}
