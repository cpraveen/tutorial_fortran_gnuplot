#!/bin/sh
fnote=`date "+%d-%B-%Y"`
latex2html -link 1  -font_size 12pt -address "Praveen. C, last updated on \
$fnote"  -antialias_text -antialias -white -noinfo -local_icons \
-short_extn -dir /home/praveen/compute-tutorial/output main
