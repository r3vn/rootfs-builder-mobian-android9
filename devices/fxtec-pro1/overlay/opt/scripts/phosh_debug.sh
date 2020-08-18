#!/bin/bash
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root"
   exit 1
fi

export EGL_PLATFORM=hwcomposer
export WLR_BACKENDS="libinput,hwcomposer"
export WLR_DIRECT_TTY=/dev/tty0
export XDG_RUNTIME_DIR="/run/user/0"

phoc -C /usr/share/phosh/phoc.ini -E "bash -lc 'gnome-session --builtin --disable-acceleration-check --session=phosh --debug'"
