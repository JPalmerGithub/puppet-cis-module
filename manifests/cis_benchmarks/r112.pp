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
    device => '/dev/xvdb9',
    options => 'nodev,nosuid,noexec',
    ensure => mounted,
  }

  mount { '/var':
    device => '/dev/xvdb5',
    options => 'nodev'
  }

  mount { '/var/log':
    device => '/dev/xvdb6',
    options => 'nodev'
  }

  mount { '/var/log/audit':
    device => '/dev/xvdb7',
    options => 'nodev'
  }

  mount { '/home':
    device => '/dev/xvdb8',
    options => 'nodev'
  }

  mount { '/var/tmp':
    device => '/tmp',
    options => 'nodev,nosuid,noexec,bind'
  }
    
  mount { '/dev/shm':
    device => 'tmpfs',
    fstype => 'tmpfs',
    options => 'nodev,nosuid,noexec',
    ensure => mounted,
  }

  exec { 'mount_shm':
    command => "/bin/true",
    unless => "/bin/mount | /bin/grep shm | /bin/grep noexec",
    notify => Mount['/dev/shm'],
  }

  exec { 'mount_tmp':
    command => "/bin/true",
    unless => "/bin/mount | /bin/grep /tmp | /bin/grep noexec",
    notify => Mount['/tmp'],
  }

}
  
