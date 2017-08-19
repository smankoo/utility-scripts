#/bin/bash

#destroy_clones.sh

PRIMARY_NAME=${PWD##*/}
ORIG_PATH=$PWD

export VAGRANT_DETECTED_OS="$(uname)"

ls -1d ${PRIMARY_NAME}_* | while read DIRNAME
do
    cd "${ORIG_PATH}" && \
    cd ${DIRNAME} && \
    vagrant destroy --force && \
    cd .. && \
    rm -rf ${DIRNAME}
done