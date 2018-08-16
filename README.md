### CIS Hardening Module for Puppet

1. Download puppet and git
```
yum install -y epel-release
yum install -y puppet git --enable-repo=epel
```
2. Download the module
```
git clone https://github.com/VoyagerInnovations/puppet-cis-module.git /etc/puppet/modules/cis
```
3. Apply
```
puppet apply -e "Package { allow_virtual => false} include cis::main" 
```
