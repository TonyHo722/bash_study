#!/bin/bash
set -xv

echo "example: dumplinae file"

while read line ; do echo "$line" ; done < $1
