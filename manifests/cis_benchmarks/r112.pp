# Ensure specific filesystems has a separate partition 
class cis::cis_benchmarks::r112 {

  file { '/etc/fstab':
    ensure => file,
    owner => 'root',
    group => 'root',
    mode => '0600'
  }

  Mount {
    ensure => present,
    fstype => 'ext4',
  }

  mount { '/tmp':
    device => '/dev/xvdb',
    options => 'nodev,nosuid,noexec'
  }

  mount { '/var':
    device => '/dev/xvdc',
    options => 'nodev'
  }

  mount { '/var/log':
    device => '/dev/xvdd',
    options => 'nodev'
  }

  mount { '/var/log/audit':
    device => '/dev/xvde',
    options => 'nodev'
  }

  mount { '/home':
    device => '/dev/xvdf',
    options => 'nodev'
  }

  mount { '/var/tmp':
    device => '/dev/xvdg',
    options => 'nodev,nosuid,noexec'
  }
    
  mount { '/dev/shm':
    device => 'tmpfs',
    fstype => 'tmpfs',
    options => 'nodev,nosuid,noexec'
  }

}
  
