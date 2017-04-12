#!/bin/bash

rm -rf /home/pi/test
mkdir /home/pi/test
dd if=/dev/zero of=/home/pi/test.dat bs=1k count=1024 # 1MB dummy file
for n in {1..100}; do
  cp /home/pi/test.dat /home/pi/test/$n.dat
done
