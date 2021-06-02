#!/usr/bin/env bashio

# Copyright 2016 Joel Martin
# Copyright 2016 Solly Ross
# Licensed under MPL 2.0 or any later version (see LICENSE.txt)

PORT="6080"
VNC_DEST=$(bashio::config 'vnc_dest')
WEB="/web"

die() {
    echo "$*"
    exit 1
}

# Process Arguments

trap "cleanup" TERM QUIT INT EXIT

# Find vnc.html
if [ -n "${WEB}" ]; then
    if [ ! -e "${WEB}/index.html" ]; then
        die "Could not find ${WEB}/index.html"
    fi
else
    die "Could not find vnc.html"
fi

WEBSOCKIFY=$(which websockify 2>/dev/null)

echo "Starting webserver and WebSockets proxy on port ${PORT}"
${WEBSOCKIFY} --web ${WEB} ${PORT} ${VNC_DEST} 
