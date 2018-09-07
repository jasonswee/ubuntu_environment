#!/bin/bash

######################################################################
#Author: Jason
######################################################################


#TODO: Create a script to automate key generation 

Generating a Key Pair the Proper way

On Local server

ssh-keygen -t rsa
On remote Server

ssh root@remote_servers_ip "mkdir -p .ssh"
Uploading Generated Public Keys to the Remote Server

cat ~/.ssh/id_rsa.pub | ssh root@remote_servers_ip "cat >> ~/.ssh/authorized_keys"
Set Permissions on Remote server

ssh root@remote_servers_ip "chmod 700 ~/.ssh; chmod 640 ~/.ssh/authorized_keys"
Login

ssh root@remote_servers_ip
Enabling SSH Protocol v2

uncomment "Protocol 2" in /etc/ssh/sshd_config

enabling public key authorization in sshd

uncomment "PubkeyAuthentication yes" in /etc/ssh/sshd_config

If StrictModes is set to yes in /etc/ssh/sshd_config then

restorecon -Rv ~/.ssh

