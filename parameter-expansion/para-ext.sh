#!/bin/bash

# reference https://www.gnu.org/software/bash/manual/html_node/Shell-Parameter-Expansion.html

FULLPATH=/usr/share/X11/test.conf_d/sk-synaptics.conf
echo -e "$FULLPATH\n"
# delete to longest match to /"
echo -e "filename = ${FULLPATH##*/}\n"
# delete to longest match to ."
echo -e "extname = ${FULLPATH##*.}\n"
