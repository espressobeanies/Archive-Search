#!/bin/bash
yum -y install dialog
echo "Archive Searcher"

###"Dialog syntax -> Single-line, calendar
SRCHSTRG=$(dialog --title "Enter search string" --inputbox  1 16);
SAVEAS=$(dialog --title "Output save location" --fselect /~ 14 48);
STRTDATE=$(dialog --title "Start Date" --calendar); 
ENDDATE=$(dialog --title "End Date" --calendar);

###Searcher using zgrep and awk
for(i=0;i<31;i++)
{
zgrep /home/BroLogs/* | awk{'print $1 $3 $4'} >> $SAVEAS
}

###Output
