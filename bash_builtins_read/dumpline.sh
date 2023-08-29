#!/bin/bash

echo "example: dumpline file"

while read line ; do echo "$line" ; done < $1
