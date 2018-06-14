#!/bin/bash

export NEWT_COLORS='
window=,red
border=white,red
textbox=white,red
button=black,white
'



if (whiptail --title "Test Yes/No Box" --yesno "Choose between Yes and No." 10 60) then
    echo "You chose Yes. Exit status was $?."
else
    echo "You chose No. Exit status was $?."
fi
