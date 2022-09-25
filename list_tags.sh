#!/bin/bash

#helper script to list all available tags for executing playbook at tag level.

ansible-playbook audit.yml -i local_hosts_file --list-tags 2>&1 |
grep "TASK TAGS" |
cut -d":" -f2 |
awk '{sub(/\[/, "")sub(/\]/, "")}1' |
sed -e 's/,//g' |
xargs -n 1 |
sort -u | 
nl -s  "..." -w3 -n rn 
