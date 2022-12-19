#!/bin/bash
if [ ! -f /usr/bin/mongod ]
    then
        $ sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
        $ echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
        $ sudo apt-get update
        $ sudo apt-get install mongodb-10gen
        $ sudo apt-get install mongodb-10gen=2.2.3
        $ echo "mongodb-10gen hold" | sudo dpkg --set-selections
        $ sudo service mongodb start


else
  echo "mongo db already installed.  Skipping..."
fi

$mongod --version