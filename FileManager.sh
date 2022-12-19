#!/bin/bash 
ACTION=$1
PARENT_DIR=$2
CHILD_DIR=$3
if [ ${ACTION} == "addDir"  ] 
then 
	PARENT_DIR=$2
	CHILD_DIR=$3
	echo " user wants to create dir ${CHILD_DIR} in ${PARENT_DIR} "
	mkdir ${PARENT_DIR}/${CHILD_DIR}
fi
if [ ${ACTION} == "deleteDir"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo " user wants to delete  ${CHILD_DIR} in ${PARENT_DIR} "
        rmdir ${PARENT_DIR}/${CHILD_DIR}
fi

if [ ${ACTION} == "listFiles"  ]
then
        PARENT_DIR=$2
        echo " user wants to list all file in a directory in ${PARENT_DIR} "
        ls -la $2 | grep ^-                        

fi
if [ ${ACTION} == "listDirs"  ]
then
        PARENT_DIR=$2
        echo " user wants to list all directory in a directory ${PARENT_DIR} "
        ls -la $2 | grep ^d 
fi
if [ ${ACTION} == "listAll"  ]
then
        PARENT_DIR=$2
        echo " user wants to list all file & directory ${PARENT_DIR} "
        ls -la $2
fi
if [ ${ACTION} == "addFile"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
	echo " user wants to Add conent at the begining of the file ${PARENT_DIR} "
        sudo touch $2/$3; sudo chmod 777 $2/$3
fi
if [ ${ACTION} ==  "addContentToFile"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo " user wants to Add conent at the begining of the file ${PARENT_DIR} "
        echo $4 > ${PARENT_DIR}/${CHILD_DIR}
fi
if [ ${ACTION} ==  "addContentToFileBegining"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo " user wants to Add addContentToFileBegining of the file ${PARENT_DIR} "
        echo $4 >> ${PARENT_DIR}/${CHILD_DIR}
fi
if [ ${ACTION} ==  "showFileBegini"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo " user wants to showFileBeginingContent of the file ${PARENT_DIR} "
        head -n $4 ${PARENT_DIR}/${CHILD_DIR}
fi

if [ ${ACTION} ==  "showFileEndContent"  ]
then

        PARENT_DIR=$2
        CHILD_DIR=$3
        echo " user wants to showFileBeginingContent of the file ${PARENT_DIR} "
        tail -n $4 ${PARENT_DIR}/${CHILD_DIR}
fi
if [ ${ACTION} ==  "showFileContentAtLine"  ]
then

        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to showFileBeginingContent of the file ${PARENT_DIR} "
        sed -n $4'p' ${PARENT_DIR}/${CHILD_DIR}
fi
if [ ${ACTION} ==  "showFileContentForLineRange"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to showFileContentForLineRange ${PARENT_DIR} "
        sed -n $4,$5'p' ${PARENT_DIR}/${CHILD_DIR}

fi
if [ ${ACTION} ==  "moveFile" ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to move file one location to another location ${PARENT_DIR} "
        sudo mv $2 $3
fi
if [ ${ACTION} ==  "copyFile"  ]
then

        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to copy file one location to another location ${PARENT_DIR} "
        sudo cp $2 $3
fi
if [ ${ACTION} ==  "clearFileContent"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to clear of file content ${PARENT_DIR} "
        echo  >${PARENT_DIR}/${CHILD_DIR} $4
fi
if [ ${ACTION} ==  "deleteFile"  ]
then
        PARENT_DIR=$2
        CHILD_DIR=$3
        echo "user wants to delete file  ${PARENT_DIR} "
        rm -rf $2/$3 $4

fi
