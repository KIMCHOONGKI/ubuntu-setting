#!/bin/bash

DATE=`date +%Y%m%d_%H%M%S`
#/bin/cp -f /home/livessun/가계부2017.xlsx /home/kimchki/BACKUP/Alice/가계부/가계부2017_${DATE}.xlsx
/bin/cp -f /home/livessun/가계부2017.xlsx /home/kimchki/HOME2/Alice/가계부/가계부2017_${DATE}.xlsx
#/bin/cp -f /home/livessun/가계부2018.xlsx /home/kimchki/BACKUP/Alice/가계부/가계부2018_${DATE}.xlsx
/bin/cp -f /home/livessun/가계부2018.xlsx /home/kimchki/HOME2/Alice/가계부/가계부2018_${DATE}.xlsx

find /home/kimchki/HOME2/Alice/가계부/ -mtime +7 -exec rm -f {} \;
#find /home/kimchki/BACKUP/Alice/가계부/ -mtime +7 -exec rm -f {} \;

echo "     [begin]" >> /home/kimchki/HOME2/rsync_alice.time
date >> /home/kimchki/HOME2/rsync_alice.time

####################################################################

#cp -rnp /home/kimchki/HOME2/Alice/2012/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2013/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2014/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2015/ /home/kimchki/HOME2/FTPD/Alice/
cp -rnp /home/kimchki/HOME2/Alice/2016/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2017/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2018/ /home/kimchki/HOME2/FTPD/Alice/

#cp -rnp /home/kimchki/HOME2/Alice/먹방/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/셀카/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/요리/ /home/kimchki/HOME2/FTPD/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/일상/ /home/kimchki/HOME2/FTPD/Alice/

#cp -rnp /home/kimchki/HOME2/Alice/Camera/ /home/kimchki/HOME2/FTPD/Alice/

#cp -rnp /home/kimchki/HOME2/Alice/가계부/ /home/kimchki/HOME2/FTPD/Alice/

####################################################################

#cp -rnp /home/kimchki/HOME2/Alice/2012/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2013/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2014/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2015/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2016/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2017/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/2018/ /home/kimchki/HOME2/XPENOLOGY/

#cp -rnp /home/kimchki/HOME2/Alice/먹방/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/셀카/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/요리/ /home/kimchki/HOME2/XPENOLOGY/
#cp -rnp /home/kimchki/HOME2/Alice/일상/ /home/kimchki/HOME2/XPENOLOGY/

#cp -rnp /home/kimchki/HOME2/Alice/Camera/ /home/kimchki/HOME2/XPENOLOGY/

####################################################################

#cp -rnp /home/kimchki/HOME2/Alice/2012/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2013/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2014/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2015/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2016/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2017/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/2018/ /home/kimchki/BACKUP/Alice/

#cp -rnp /home/kimchki/HOME2/Alice/먹방/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/셀카/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/요리/ /home/kimchki/BACKUP/Alice/
#cp -rnp /home/kimchki/HOME2/Alice/일상/ /home/kimchki/BACKUP/Alice/

#cp -rnp /home/kimchki/HOME2/Alice/Camera/ /home/kimchki/BACKUP/Alice/

####################################################################

#cp -fp /home/kimchki/.bashrc /home/kimchki/HOME2/bashrc
#cp -fp /home/kimchki/.vimrc /home/kimchki/HOME2/vimrc
#cp -fp /etc/rc.local /home/kimchki/HOME2/
#cp -fp /etc/fstab /home/kimchki/HOME2/
#cp -fp /etc/apache2/sites-available/000-default.conf /home/kimchki/HOME2/
#cp -fp /etc/network/interfaces /home/kimchki/HOME2/

#crontab -l > /home/kimchki/HOME2/crontab

#cp -fp /home/kimchki/HOME2/* /home/kimchki/BACKUP/

####################################################################

echo "     [end]" >> /home/kimchki/HOME2/rsync_alice.time
date >> /home/kimchki/HOME2/rsync_alice.time
echo "" >> /home/kimchki/HOME2/rsync_alice.time
#cp -fp /home/kimchki/HOME2/rsync_alice.time /home/kimchki/BACKUP

