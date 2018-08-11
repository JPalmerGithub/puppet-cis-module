# Set Bootloader Permissions
class cis::cis_benchmarks::r141 {

  file { '/boot/grub/menu.lst':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  } 

}
