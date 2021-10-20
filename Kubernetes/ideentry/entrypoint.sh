#!/bin/bash
mkdir /root/.ssh
cp -Rf /home/git/YottaDB-Demo/.ssh/* /root/.ssh
mkdir /home/theia/.theia
cp -Rf /home/git/YottaDB-Demo/Kubernetes/.theia /home/theia/.theia
mkdir /home/yottadb-settings
cp -Rf /home/git/YottaDB-Demo/project /home/yottadb-settings
cd /home/theia
node /home/theia/src-gen/backend/main.js /home/project --hostname=0.0.0.0
