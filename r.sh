#!/bin/bash

echo "     [begin]" >> /home/kimchki/r.time
date >> /home/kimchki/r.time

rsync -az --delete 35.188.212.253:/home/kimchki/rsync_source /home/kimchki/

echo "     [end]" >> /home/kimchki/r.time
date >> /home/kimchki/r.time

echo "" >> /home/kimchki/r.time
