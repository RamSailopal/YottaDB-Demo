#!/bin/bash
sudo mkdir /root/.ssh
sudo cp -Rf /home/git/YottaDB-Demo/.ssh/* /root/.ssh
sudo cp -Rf /home/git/YottaDB-Demo/Kubernetes/.theia/* /home/theia/.theia
sudo mkdir /home/yottadb-settings
sudo cp -Rf /home/git/YottaDB-Demo/project/* /home/yottadb-settings
cd /home/theia
node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0
