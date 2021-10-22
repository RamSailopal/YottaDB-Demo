#!/bin/bash
cd /usr/local/YottaDB-dashboard/glbview
/usr/local/YottaDB-dashboard/glbview/globview.sh start

cd /opt/mgweb
chmod 0777 mapped

if [ -f "/opt/mgweb/mapped/start" ]; then
  echo "Running user customisation start file"
  chmod +x /opt/mgweb/mapped/start
  /opt/mgweb/mapped/start
fi

term_handler(){
   echo "*** Container stopping - Please wait *****"
   /etc/init.d/apache2 stop
   echo "Apache stopped and connections to YottaDB released"
   sleep 5
   echo "Container will now stop"
   exit 0
}

# Setup signal handlers
trap 'term_handler' SIGTERM
trap 'term_handler' SIGINT

if [ ! -f "/opt/mgweb/mapped/mgweb.conf.json" ]; then
  mv /opt/mgweb/mgweb.conf.json /opt/mgweb/mapped
fi

if [ ! -f "/opt/mgweb/mapped/mpm_event.conf" ]; then
  mv /opt/mgweb/mpm_event.conf /opt/mgweb/mapped
fi

export ydb_gbldir=/opt/yottadb/yottadb.gld
out=$(ydb <<< 'W $ZV ZL "_zmgwebUtils" D start^%zmgwebUtils' 2>&1)
echo "$out"
if grep -q "%YDB-E" <<< $out
then
	pid=$(lsof | grep mgweb.dat | awk '{ print $2 }')
	if [[ "$pid" != "" ]]
	then
		kill -9 $pid
                /usr/local/lib/yottadb/r130/mupip rundown -region default
                ydb <<< 'D start^%zmgwebUtils'
        else
                /usr/local/lib/yottadb/r130/mupip rundown -region default
                ydb <<< 'D start^%zmgwebUtils'
	fi
fi
/usr/local/lib/yottadb/r130/mupip rundown -region default
/etc/init.d/apache2 start
echo "Apache started"
#service xinetd start

echo ""
echo "The mgweb Container is ready for use!"
echo ""

while true
do
   tail -f /var/log/apache2/other_vhosts_access.log & wait ${!}
done

