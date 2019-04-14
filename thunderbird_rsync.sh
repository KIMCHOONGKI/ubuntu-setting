#!/bin/bash

TIME_DIR=r.time

echo "     [begin]" >> ${TIME_DIR}
date >> ${TIME_DIR}

time /usr/bin/rsync -avz --delete -e 'ssh -p 222' . kimchki@kimchki.synology.me:/volume1/homes/kimchki/Thunderbird/

echo "     [end]" >> ${TIME_DIR}
date >> ${TIME_DIR}

echo "" >> ${TIME_DIR}

