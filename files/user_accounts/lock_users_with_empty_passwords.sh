#!/bin/bash

NOPASSWD_USERS=`cat /etc/shadow | awk -F: '($2 == "" ) { print $1 }'`

for USER in ${NOPASSWD_USERS[@]}
do
  echo $USER " does not have a password."
  /usr/bin/passwd -l $USER
done
