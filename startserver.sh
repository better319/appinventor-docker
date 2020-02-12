#!/bin/bash
set -e
echo "Trying to launchh app inventor server!"
cd /opt/src/appinventor
ant RunLocalBuildServer &> buildserver.log &
BUILDSERVER=$!
dev_appserver.sh -p 8888 -a 0.0.0.0 appengine/build/war
kill -9 -- -$BUILDSERVER
