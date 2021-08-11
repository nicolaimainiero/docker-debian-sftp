#! /bin/bash

mkdir -p /home/user/.ssh
touch /home/user/.ssh/authorized_keys

public_keys=`ls /docker-entrypoint.d/*.pub`
for eachfile in $public_keys
do
   cat $eachfile >> /home/user/.ssh/authorized_keys
done

chown -R user:sftp-users /home/user/.ssh/
chmod 0600 /home/user/.ssh/authorized_keys

service ssh start && bash