#!/bin/bash
# makerun.sh
# Make sure geekcashd is always running.
# Add the following to the crontab (i.e. crontab -e)
# */1 * * * * ~/condominium/makerun.sh

process=condominiumd
makerun="condominiumd"

if ps -u $USER | grep -v grep | grep $process > /dev/null
then
echo "process runing"
  exit
else
echo "process need restart"
  $makerun -daemon $1 $2 &
fi 
