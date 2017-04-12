#!/bin/bash

# Definitions
rrd_dir="../../rrd"		# Directory with rrd files
plot_dir="../../plots"		# Diretory with plots

# Derive the name for the data variable from the filename
# of this script
name=$(basename $0)
name=${name%.*}

# Check if the rrd database exists. If not, create it.
[ -f $rrd_dir/$name.rrd ] || {
  rrdtool create $rrd_dir/$name.rrd \
    --start N --step 60 \
    DS:cputemp:GAUGE:120:0:120 \
    RRA:AVERAGE:0.5:1:10080 \
    RRA:MIN:0.5:10:4032 \
    RRA:AVERAGE:0.5:10:4032 \
    RRA:MAX:0.5:10:4032 \
    RRA:MIN:0.5:60:4320 \
    RRA:AVERAGE:0.5:60:4320 \
    RRA:MAX:0.5:60:4320 \
    RRA:MIN:0.5:720:1460 \
    RRA:AVERAGE:0.5:720:1460 \
    RRA:MAX:0.5:720:1460
}

# Retrieve data and store it in database
raw=$(cat /sys/class/thermal/thermal_zone0/temp)
value="${raw:0:2}.${raw:2}"

rrdtool update $rrd_dir/$name.rrd "valuee"

# Update plots
rrdtool graph ${plot_dir}/${name}_day.png \
  --title="$name" \
  --end now --start now-24h \
  DEF:min=$rrd_dir/$name.rrd:$name:MIN \
  DEF:avg=$rrd_dir/$name.rrd:$name:AVERAGE \
  DEF:max=$rrd_dir/$name.rrd:$name:MAX \
  'AREA:max#B7B7F7' \
  'AREA:min#FFFFFF' \
  'LINE1:avg#0000FF'

exit 0
