#!/bin/bash
# checkdaemon.sh
# Make sure the daemon is not stuck.
# Add the following to the crontab (i.e. crontab -e)
# */30 * * * * ~/condominium/checkdaemon.sh

previousBlock=$(cat ~/condominium/blockcount)
currentBlock=$(condominium-cli $1 $2 getblockcount)

condominium-cli $1 $2 getblockcount > ~/condominium/blockcount

if [ "$previousBlock" == "$currentBlock" ]; then
  condominium-cli $1 $2 stop
  sleep 5
  condominiumd -daemon $1 $2 
fi 
