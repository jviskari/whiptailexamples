#!/bin/bash
# Whiptail is the interactive shell Scrpting
OPTION=$(whiptail --title "Whiptail Shell Script Menu" --menu "Choose your option" 15 60 4 \
"1" "Change Password" \
"2" "Change UserName" \
"3" "Change Email" \
"4" "exit"  3>&1 1>&2 2>&3)

exitstatus=$?
if [ $exitstatus = 0 ]; then
    echo "Your chosen option:" $OPTION

case $OPTION in
  1) echo "Option1 Selected"
     if (whiptail --title "Change Password" --yes-button "Yes" --no-button "No"  --yesno "Do you need to changed Password ?" 10 60) then
    echo "password Selection Yes$?."
     
    # Start Password Box
    PASSWORD=$(whiptail --passwordbox "please enter your secret password" 8 78 --title "Change Password" 3>&1 1>&2 2>&3)
                                                                        # A trick to swap stdout and stderr.
    # Again, you can pack this inside if, but it seems really long for some 80-col terminal users.
     exitstatus=$?
 if [ $exitstatus = 0 ]; then
     echo "User selected Ok and entered " $PASSWORD
     touch sample_out_put.txt
     echo $PASSWORD > sample_out_put.txt
            
            # Start Progress Bar
      {
       for ((i = 0 ; i <= 100 ; i+=5)); do
  sleep 0.3
  echo $i
     done
      } | whiptail --gauge "Password Updating.." 6 50 0
            # End Progress Bar    

 else
     echo "User selected Cancel."
 fi

    # End Password Box 
     else
    echo "Password Selection No$?."
     fi
     ;;
  2) echo "option2 Selected"
 # Change User Name Box
 NAME=$(whiptail --inputbox "Change Username " 8 78  --title "Changed UserName" 3>&1 1>&2 2>&3) 
 exitstatus=$?
 if [ $exitstatus = 0 ]; then
     echo "UserName Changed " $NAME
 if (whiptail --title "Confirm Change UserName" --yes-button "Yes" --no-button "No"  --yesno "Do you need to changed UserName ?" 10 60)  then
     echo "Username Confirm Yes$?."
     # Start Progress Bar
      {
       for ((i = 0 ; i <= 100 ; i+=5)); do
  sleep 0.3
  echo $i
       done
      } | whiptail --gauge "UserName Updating.." 6 50 0
            # End Progress Bar 
 else
  echo"Confirm Failed"
 fi

 else 
    echo "UserName Not Changed"
 fi

     ;;
  3) echo "Option3 Selected"
     
     ;;
  4) echo "exit"
     {
    for ((i = 0 ; i <= 100 ; i+=5)); do
        sleep 0.1
        echo $i
    done
     } | whiptail --gauge "exit..." 6 50 0
esac

else
    echo "You chose Cancel."
fi
