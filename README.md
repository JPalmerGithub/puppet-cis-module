### CIS Hardening Module for Puppet

1. Download the module
```
git clone https://github.com/VoyagerInnovations/puppet-cis-module.git /etc/puppet/modules/cis
```
2. Apply
```
puppet apply -e "Package { allow_virtual => false} include cis::main" 
```
