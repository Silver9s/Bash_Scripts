#!/bin/sh
#
# Quits Microsoft Edge.app before running software update
appName="Microsoft Edge.app"
processCheck=$(pgrep -i ${appName})
    if [ "${processCheck}" = "Microsoft Edge.app" ]; then
        echo "${appName} is not running..."
    else
        echo "${appName} is running..."
        echo "${appName} Process ID: ${processCheck}"
        echo "Quitting ${appName}..."
        sudo kill -9 ${processCheck}
    fi

sleep 1

#This part of the script will delete the files that the older Microsoft Edge applicaton does not delete after updates. 

rm -rf /Library/Application\ Support/Microsoft/EdgeUpdater/apps/msedge-stable/*

sleep 1


exit 0