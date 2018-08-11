# Disable IMAP and POP3 server
class cis::cis_benchmarks::r2211 {

  Exec {
    path => [ '/bin', '/sbin' ],
    user => 'root',
  }

  exec { 'disable-dovecot':
    command => 'chkconfig dovecot off',
    onlyif => 'chkconfig --list | grep dovecot | grep on'
  }

}
