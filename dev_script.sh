#! /bin/bash

tmp=$(ls -1 /home/slepine/Downloads/plan-ahead-app/common | wc -l);
if [[ $tmp -lt 2 ]]; then
    if [ "$EUID" != 0 ]; then
        sudo "$0" "$@"
        exit $?
    fi

    sudo mount -o bind /home/slepine/Downloads/shared_code/svelte_common/ /home/slepine/Downloads/plan-ahead-app/common;
fi
