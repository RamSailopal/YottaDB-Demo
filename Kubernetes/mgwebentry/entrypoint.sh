#!/bin/bash
service ssh start
cd /usr/local/YottaDB-dashboard/glbview
/usr/local/YottaDB-dashboard/glbview/globview.sh start
/usr/local/bin/start.sh
cd /opt/mgweb && /opt/mgweb/start
