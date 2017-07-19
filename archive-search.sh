#!/bin/bash
echo "Archive Searcher"

###Declare main variables
SRCHSTRG=$(dialog --title "Enter search string" --inputbox  1 16);
SAVEAS=$(dialog --title "Output save location" --fselect /~ 14 48);
STRTDATE=$(dialog --title "Start Date" --calendar); 
ENDDATE=$(dialog --title "End Date" --calendar);

###Declare truncated variables
STRTDY=$(cut -c 1-2 $STRTDATE);
ENDDY=$(cut -c 1-2 $ENDDATE);
STRTMO=$(cut -c 4-5 $STRTDATE);
ENDMO=$(cut -c 4-5 $ENDDATE);
STRTYR=$(cut -c 7-8 $STRTDATE);
ENDYR=$(cut -c 7-8 $ENDDATE);

###Declare functions
search()
{
  for(i=$1;i<=$2;i++)
    {
      zgrep "$SRCHSTRG" /home/BroLogs/$i* | cf >> $SAVEAS &  
      echo "Now searching" $i ###Replace with dialog info box
    }
}

###Execute functions baesed on IF-statements. Incomplete ATM.
search $STRTDY $ENDDY
search $STRTMO $ENDMO
search $STRTYR $ENDYR

###Output
clear
echo "Search complete!"\n"Your results can be viewed from the following location:" $SAVEAS
