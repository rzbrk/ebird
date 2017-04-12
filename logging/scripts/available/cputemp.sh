#!/bin/bash

# Define directory
rrd_dir="../../rrd"		# Directory with rrd files
plot_dir="../../plots"		# Diretory with plots

# Check if the rrd database exists. If not, create it.
[ -f $rrd_dir/cputemp.rrd ] || {
  rrdtool create $rrd_dir/cputemp.rrd \
    --step 60 \
    DS:cputemp:GAUGE:120:0:120 \
#   1 wekk, intervall 1 min
    RRA:AVERAGE:0.5:1:10080 \
#   4 weeks, intervall 10 min
    RRA:MIN:0.5:10:4032 \
    RRA:AVERAGE:0.5:10:4032 \
    RRA:MAX:0.5:10:4032 \
#   6 month, intervall 1 h
    RRA:MIN:0.5:60:4320 \
    RRA:AVERAGE:0.5:60:4320 \
    RRA:MAX:0.5:60:4320 \
# 2 years, intervall 12 h
    RRA:MIN:0.5:720:1460 \
    RRA:AVERAGE:0.5:720:1460 \
    RRA:MAX:0.5:720:1460
}

# Retrieve data and store it in database
t=$(cat /sys/class/thermal/thermal_zone0/temp)
cputemp="${t:0:2}.${t:2}"

rrdtool update $rrd_dir/cputemp.rrd N:$cputemp

# Update plots
rrdtool graph cputemp_day.png \
  --end now --start now-24h \
  DEF:min=$rrd_dir/cputemp.rrd:value:MIN \
  DEF:avg=$rrd_dir/cputemp.rrd:value:AVERAGE \
  DEF:max=$rrd_dir/cputemp.rrd:value:MAX \
  'AREA:max#B7B7F7' \
  'AREA:min#FFFFFF' \
  'LINE1:avg#0000FF'


