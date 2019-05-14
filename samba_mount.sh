#!/bin/bash


mount -t cifs //172.30.1.108/d /home/kimchki/HOME2/FTPD -o user=livessun,password=alice0914*,uid=1000,gid=1000


#mount -t cifs //172.30.1.108/d /home/kimchki/HOME2/FTPD -o user=kimchki,password=bubuk7468,uid=1000,gid=1000
#mount -t cifs //172.30.1.108/e /home/kimchki/HOME2/FTPE -o user=kimchki,password=bubuk7468,uid=1000,gid=1000
#mount -t cifs //172.30.1.108/f /home/kimchki/HOME2/FTPF -o user=kimchki,password=bubuk7468,uid=1000,gid=1000
#mount -t cifs //172.30.1.108/g /home/kimchki/HOME2/FTPG -o user=kimchki,password=bubuk7468,uid=1000,gid=1000
#mount -t cifs //172.30.1.108/h /home/kimchki/HOME2/FTPH -o user=kimchki,password=bubuk7468,uid=1000,gid=1000
#mount -t cifs //172.30.1.105/photo /home/kimchki/HOME2/XPENOLOGY -o user=livessun,password=alice0914*,uid=1000,gid=1000
#mount -t cifs //172.30.1.107/Users/kimchki /home/kimchki/HOME2/kimchki -o user=kimchki,password=bubuk7468,uid=1000,gid=1000


# xpenology mount path
# \\172.30.1.108\e\HOME\FTPData1
# \\172.30.1.108\f\FTPData2
# \\172.30.1.108\h\FTPData3
# \\172.30.1.107\Users\kimchki

mount -t cifs //172.21.17.184/조직-오픈소스sw그룹/DBMS파트 /home/postgresql/www/DBMS파트 -o vers=2.1,user=ck0911.kim,password=score0911*,uid=1001,gid=1001


