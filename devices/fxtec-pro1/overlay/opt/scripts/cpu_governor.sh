#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi
if [ "$#" -lt 1 ]
then
	# show current cpu governor for all cpus
	echo "set cpu governor with: $0 [governor]"
	cat /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor
else
	# set cpu governor
	echo $1 | tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor >/dev/null
fi
