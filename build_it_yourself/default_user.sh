#! /bin/bash

readonly user='user'
readonly password='password'


useradd $user -s /usr/sbin/nologin -g sftp-users -m && \
echo $user:$password | chpasswd && \
chmod 700 /home/$user && setfacl -dRm u::7,g::0,o::0 /home/$user && mkdir -p /home/$user/export && \
chown -R $user:sftp-users /home/$user/export/ && setfacl -dRm u::7,g::0,o::0 /home/$user/export && \
chown root:root /home/$user/ && chmod 755 /home/$user