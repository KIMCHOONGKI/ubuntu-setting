
docker run -d --name confluence-srv -e TZ='Asia/Seoul' -p 8090:8090 -v /root/confluence/confluence:/var/confluence haxqer/confluence:latest

docker exec confluence-srv java -jar /var/agent/atlassian-agent.jar -p conf -m kimchki@gmail.com -n kimchki@gmail.com -o http://attack.asuscomm.com -s BV9M-AXDN-A10M-SER6

docker run -d --name mariadb2 -e MARIADB_ROOT_PASSWORD='1q2w3e4r!' -p 3307:3306 -v /root/confluence/mariadb2.conf.d:/etc/mysql/mariadb.conf.d -v /root/confluence/mariadb2:/var/lib/mysql -v /root/confluence/share:/share mariadb

docker run -d --name nginx1 -p 8080:80 nginx

