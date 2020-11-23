mount -t cifs "//fileserver.score/조직-오픈소스SW그룹/DBMS파트/EDB" "/mnt" -o username=ck0911.kim,password=score0911*,uid=1001,gid=1001
time su - postgresql -c 'rsync -avzr --delete /mnt/ /1T/www/EDB'
umount "/mnt"

mount -t cifs "//fileserver.score/조직-오픈소스SW그룹/DBMS파트/MariaDB 자료" "/mnt" -o username=ck0911.kim,password=score0911*,uid=1001,gid=1001
time su - postgresql -c 'rsync -avzr --delete /mnt/ "/1T/www/MariaDB 자료"'
umount "/mnt"

mount -t cifs "//fileserver.score/조직-오픈소스SW그룹/DBMS파트/OS" "/mnt" -o username=ck0911.kim,password=score0911*,uid=1001,gid=1001
time su - postgresql -c 'rsync -avzr --delete /mnt/ /1T/www/OS'
umount "/mnt"

#rsync -au /local/directory/ host:/remote/directory/
#rsync -a --ignore-existing /local/directory/ host:/remote/directory/

