#!/bin/sh
set -eu

if [ -f "/etc/os-release" ]
then
    . "/etc/os-release"
elif [ -f "/usr/lib/os-release" ]
then
    . "/usr/lib/os-release"
else
    echo "Can't find the os-release file. Abort."
    exit
fi

case ${NAME} in
    "Ubuntu")
        echo "Ubuntu system detected."
        . "${PWD}/distro/ubuntu.sh"
        ;;
    "openSUSE Tumbleweed" | "openSUSE Leap")
        echo "openSUSE system detected."
        . "${PWD}/distro/open-suse.sh"
        ;;
    *)
        echo "Unknown system detected. Abort."
        exit
        ;;
esac
