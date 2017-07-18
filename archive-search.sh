#!/bin/bash
yum -y install dialog
echo "Archive Searcher"

###"Dialog syntax -> Single-line, calendar
SRCHSTRG=$(dialog --title "Enter search string" --inputbox  1 16);
SAVEAS=$(dialog --title "text" --fselect /~ 14 48);
###Searcher using zgrep and awk

###Output
