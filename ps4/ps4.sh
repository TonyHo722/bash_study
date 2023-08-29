#!/bin/bash
# set -xv
set -x
PS4='${LINENO}: '

echo "example: dumplinae file"

while read line ; do echo "$line" ; done < $1
set +x
