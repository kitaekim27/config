#!/bin/sh
set -eu

if [ -f "/etc/os-release" ]
then
    source "/etc/os-release"
elif [ -f "/usr/lib/os-release" ]
then
    source "/usr/lib/os-release"
else
    echo "Can't find the os-release file. Abort."
    exit
fi

case ${NAME} in
    "Ubuntu")
        echo "Ubuntu system detected."
        source "${PWD}/distro/ubuntu.sh"
        ;;
    "OpenSUSE")
        echo "OpenSUSE system detected."
        source "${PWD}/distro/open-suse.sh"
        ;;
    *)
        echo "Unknown system detected. Abort."
        exit
        ;;
esac
