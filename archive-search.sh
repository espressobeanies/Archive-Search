#!/bin/bash
echo "Archive Searcher"

###Declare main variables
SRCHSTRG=$(dialog --title "Enter search string" --inputbox  1 16);
SAVEAS=$(dialog --title "Output save location" --fselect /~ 14 48);
STRTDATE=$(dialog --title "Start Date" --calendar); 
ENDDATE=$(dialog --title "End Date" --calendar);

###Declare truncated variables
STRTDY=$();
ENDDY=$();
STRTMO=$();
ENDMO=$();
STRTYR=$();
ENDYR=$();

###Declare functions
search()
{
  for(i=$1;i<=$2;i++)
    {
      zgrep "$SRCHSTRG" /home/BroLogs/$i* >> $SAVEAS &    
    }
}

###Execute functions
search $STRTDY $ENDDY

###Output
