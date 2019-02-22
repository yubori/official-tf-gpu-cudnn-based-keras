#!/bin/bash
CUDA_DEV=
CUR_UID=$(id -u)
CUR_GID=$(id -g)
while getopts "d:" opt; do
    case "$opt" in
        d)
            CUDA_DEV="CUDA_VISIBLE_DEVICES=$OPTARG"
            ;;
    esac
done
shift `expr $OPTIND - 1`

CUR_DIR=$(pwd)

sudo docker run --runtime=nvidia -it --rm -v $CUR_DIR:$CUR_DIR tf-gpu-py3-keras:1.0 sh -c "cd $CUR_DIR && $CUDA_DEV sudo -u '#$CUR_UID' -g '#$CUR_GID' python3 $*"
