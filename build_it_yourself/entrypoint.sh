#! /bin/bash

public_keys=`ls /docker-entrypoint.d/*.pub`
for eachfile in $public_keys
do
   cat $eachfile >> /home/user/.ssh/authorized_keys
done

chmod 0600 /home/user/.ssh/authorized_keys

service ssh start && bash