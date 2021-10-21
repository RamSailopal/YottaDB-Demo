#!/bin/bash
service ssh start
mkdir /root/.ssh
cp -Rf /home/git/YottaDB-Demo/.ssh/* /root/.ssh
mkdir /home/footie
cp -Rf /home/git/YottaDB-Demo/EnglishFootball/* /home/footie
cp /home/git/YottaDB-Demo/lsyncd/lsyncd.conf /etc/lsyncd.conf
mkdir /home/entrypoint
cp -Rf /home/git/YottaDB-Demo/Kubernetes/mgwebentry/* /home/entrypoint
cp -Rf /home/git/YottaDB-Demo/mapped/* /opt/mgweb/mapped
/usr/local/bin/start.sh
/home/entrypoint/start.sh
