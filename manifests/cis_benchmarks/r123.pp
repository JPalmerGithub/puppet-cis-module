# Enable gpgcheck
class cis::cis_benchmarks::r123 {

  exec { 'enable-yum-gpgcheck':
    path => [ '/usr/bin', '/bin' ],
    command => "sed -i -e 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.conf",
    user => 'root',
    unless => "grep ^gpgcheck /etc/yum.conf | awk -F'=' '{print \$2}' | grep 1"
  }

  exec { 'enable-repo-gpgcheck':
    path => [ '/usr/bin', '/bin' ],
    command => "sed -i -e 's/gpgcheck=0/gpgcheck=1/g' /etc/yum.repos.d/*",
    user => 'root',
    onlyif => "grep ^gpgcheck /etc/yum.repos.d/* | awk -F'=' '{print \$2}' | grep 0"
  }

}
