#!/bin/bash

echo "example: dumpline-all file"

while read line || [ -n "$line" ] ; do echo "$line" ; done < $1
