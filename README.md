# Introduction

![Alt text](metadash.PNG?raw=true "Metabase Dashboard")

This repo came about as the result of two personal aims:

1) To show that the football club I support, West Bromwich Albion, has historically been a successful football club when it come to the English domestic football scene

2) To showcase how easy it is to integrate YottaDB data with business intellegence tools.

# Procedure

The solution builds primarily on the YottaDB-APIDev repo:

https://github.com/RamSailopal/YottaDB-APIDev

Data was scraped from the following link - https://en.wikipedia.org/wiki/List_of_football_clubs_in_England_by_competitive_honours_won and pulled into a YottaDB global called ^Football A "dump" of this global can be found in:

   EnglishFootball/Football.go

![Alt text](footieglo.PNG?raw=true "Football Global")

The categorised data was then served via various endpoints:

![Alt text](footieide.PNG?raw=true "Football IDE")

These endpoints were then "consumed" via the Metabase open source business intellegence tool and the http plugin and view data in graph format.

# Provisioning the Stack

      git clone https://github.com/RamSailopal/YottaDB-Demo.git
      cd YottaDB-Demo/demo
      export glbviewadd="192.168.240.1"
      
Where glbviewadd is the address of the server/machine running Docker.

     docker-compose up
     
Then to view globals:

     http://ipaddressofdockerserver:8001

To view code:

     http://ipofdockerserver:3002/#/home/yottadb-settings/Yottadb.theia-workspace

To view the dashboards:

    http://ipofdockerserver:3001/dashboard/1 - Domestic leagues/cups
    http://ipofdockerserver:3001/dashboard/2 - International leagues/cups
    http://ipofdockerserver:3001/dashboard/3 - Domestic/International leagues/cups

Enter the following username and password:

    footiedemo@test.com
    Ball1nthenet

Each graph represents a "question/native query" in the format e.g.:

    { "url": "http://demo_yottamgweb_1:8080/api/totinthons" }

# SSH Keys

This repo contains ssh keys for demonstation/sandpit purposes only. For a production environment, please set up new, none source controlled keys.

# Conclusion

1) West Bromwich Albion is the joint 15th most successful football club in England (consisting of 92 professional clubs)!!!

2) YottaDB can be integrated with third party business intellegence tools even without the need of using the SQL Octo plugin.

# Credit

Special thanks goes to Rob Tweed for developing the initial mgweb-server implementation:

https://github.com/robtweed/mgweb-server

Also:

Eclipse Theia web IDE:

https://theia-ide.org/

Metabase business intellegence tool:

https://www.metabase.com/

Tom Robinson - Metabase HTTP driver:

https://github.com/tlrobinson/metabase-http-driver

