# 3.6.3 Loopback traffic
class cis::cis_benchmarks::r363 {

  exec { 'allow_loopback':
    command => '/sbin/iptables -A INPUT -i lo -j ACCEPT',
    unless => '/sbin/iptables -S | /bin/grep "\-A INPUT \-i lo \-j ACCEPT"',
    require => Package['iptables'],
  }



  exec { 'allow_OUTPUT':
    command => '/sbin/iptables -A OUTPUT -o lo -j ACCEPT',
    unless => '/sbin/iptables -S | /bin/grep "\-A OUTPUT \-o lo \-j ACCEPT"',
    require => Package['iptables'],
  }

  exec { 'allow_INPUT':
    command => '/sbin/iptables -A INPUT -s 127.0.0.0/8 -j DROP',
    unless => '/sbin/iptables -S | /bin/grep "\-A INPUT \-s 127.0.0.0/8 \-j DROP"',
    require => Package['iptables'],
  }

}
