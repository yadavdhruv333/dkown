#!/bin/bash
action=$1
command2=$2
command3=$3

#./UserManager.sh addTeam amigo

function addgroup() {
echo "user wants to add group"
sudo addgroup $1
}

#./UserManager.sh addUser Rakesh amigo
function createuser() {
        user=$1
        group=$2
        echo "create user"
sudo useradd -m -g $group $user
sudo chmod 755 /home/$user
cd /home/$user
sudo mkdir -p $group ninja
sudo chmod 770 $group
sudo chgrp $group $group
sudo chmod 777 ninja
sudo chgrp ninja ninja
}
sudo addgroup ninja
if [ $action == addTeam ]
then
        addgroup $command2
fi
if [ $action == addUser ]
then
        createuser $command2 $command3
fi

