#!/bin/bash

TIME_DIR=/home/pi/r.time

echo "     [begin]" >> ${TIME_DIR}
date >> ${TIME_DIR}

rsync -az --delete 35.188.212.253:/home/kimchki/rsync_source /home/kimchki/

echo "     [end]" >> ${TIME_DIR}
date >> ${TIME_DIR}

echo "" >> ${TIME_DIR}
