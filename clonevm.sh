#!/bin/bash

# clonevm.sh
# Script to create and start multiple copies of the current VM

CREATE_COPIES=3 # defaults to 3 copies

if [ "${1}" != "" ]; then                   # ensure 1st arg isn't blank
    if [[ "${1}" =~ ^[0-9]+$ ]];then        # ensure it's an integer
        CREATE_COPIES=$1
    fi
fi

PRIMARY_NAME=${PWD##*/}
ORIG_PATH=$PWD

i=1
while [ $i -le ${CREATE_COPIES} ];
do
    cd "${ORIG_PATH}"
    
    NEWDIRNAME=${PRIMARY_NAME}_${i}

    if [ -d ${NEWDIRNAME} ]; then
        echo Removing old directory ${NEWDIRNAME}
        rm -rf ${NEWDIRNAME}
    fi
    

    if [ ! -d ${NEWDIRNAME} ]; then
        mkdir ${NEWDIRNAME} && \
        cp Vagrantfile ${NEWDIRNAME} && \
        cd ${NEWDIRNAME} && \
        vagrant up 
    fi
    i=$((i+1))
done
