# Ensure no ungrouped files or directories exist
class cis::cis_benchmarks::r6112 {

  exec { 'check-ungrouped-files':
    path => [ '/bin', '/usr/bin' ],
    command => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -nogroup > /var/log/cis/ungrouped_files_dir.log",
    user => 'root',
    onlyif => "df --local -P | awk {'if (NR!=1) print \$6'} | xargs -I '{}' find '{}' -xdev -nogroup | grep /",
    notify => Exec['ungrouped_files'],
  }

  exec { 'ungrouped_files':
    path => '/bin',
    command => 'echo Check /var/log/cis/ungrouped_files_dir.log for ungrouped files and directories.',
    logoutput => true,
    refreshonly => true,
  }

}
