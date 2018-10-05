# Audit processes prior to auditd
class cis::cis_benchmarks::r413 {


  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {
    $grub_config_path = "/etc/default/grub"
  }
  elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {
    $grub_config_path = "/etc/sysconfig/grub" 
  } else {
    $grub_config_path = "/etc/sysconfig/grub"
  }


  if $osfamily == 'Redhat' and $operatingsystemmajrelease == '7' {

    file_line { 'enable_audit_before_auditd':
      line => 'GRUB_CMDLINE_LINUX="audit=1 console=tty0 crashkernel=auto console=ttyS0,115200"',
      path => "$grub_config_path",
      match => '^GRUB_CMDLINE_LINUX=',
      replace => true,
      ensure   => present,
      notify => Exec['apply_new_grub_conf'],
    } 

    exec { 'apply_new_grub_conf':
      command => '/sbin/grub2-mkconfig > /boot/grub2/grub.cfg',
      refreshonly =>true,
    }

  } elsif $osfamily == 'Redhat' and $operatingsystemmajrelease == '6' {

    file_line { 'enable_audit_before_auditd_sysconfig':
      line => 'GRUB_CMDLINE_LINUX="audit=1 console=tty0 crashkernel=auto console=ttyS0,115200"',
      path => "$grub_config_path",
      match => '^GRUB_CMDLINE_LINUX=',
      replace => true,
      ensure   => present,
    } 

    exec { 'enable_audit_before_auditd_etc':
      command => "sed -i 's/ ro / ro audit=1 /g' /boot/grub/grub.conf ",
      path => "/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin",
      unless => "grep -P -o ' ro audit=1 ' /boot/grub/grub.conf",
    }



  }

}
