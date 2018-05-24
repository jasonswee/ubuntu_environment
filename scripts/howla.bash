#!/bin/bash

######################################################################
#Author: Jason
######################################################################

#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`

#Initialize variables to default values.
MAKE_OPT="" #normal
SUDO_RUN=false 

#Set fonts for Help.
Blk='\033[0;30m'     
DGry='\033[1;30m'
Red='\033[0;31m'     
LRed='\033[1;31m'
Grn='\033[0;32m'     
LGrn='\033[1;32m'
Bro='\033[0;33m'     
Yel='\033[1;33m'
Blu='\033[0;34m'     
LBlu='\033[1;34m'
Pur='\033[0;35m'     
LPur='\033[1;35m'
Cyn='\033[0;36m'     
LCyn='\033[1;36m'
LGry='\033[0;37m'   
Whi='\033[1;37m'
NC='\033[0m'

#Help function
function HELP {
  echo -e \\n"Help documentation for ${LGrn}${SCRIPT}.${NC}"\\n
  echo -e "${LBlu}-s${Yel}  --Runs command in sudo${NC}."
  #echo -e "${LBlu}-l${Yel}  --Light Build${NC}."
  #echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
  #echo -e "Example: ${BOLD}$SCRIPT -a foo -b man -c chu -d bar file.ext${NORM}"\\n
  exit 1
}

### Start getopts code ###

#Parse command line flags
#If an option should be followed by an argument, it should be followed by a ":".
#Notice there is no ":" after "h". The leading ":" suppresses error messages from
#getopts. This is required to get my unrecognized option code to work.

while getopts "hs:" FLAG; do
  case $FLAG in
    s)  #set option "s"
      RUN_THIS=$@ #"$OPTARG"
      echo -e "${NC}Recorded command is ${Yel}$RUN_THIS${NC}"
      SUDO_RUN="true"
	;;
    l)
      MAKE_OPT="light"
      echo "Light build"
      ;;
    h)  #show help
      HELP
     ;;
    \?) #unrecognized option - show help
      echo -e \\n"Option -${Red}$OPTARG not allowed.${NC}"
      ;;
  esac
done

shift $((OPTIND-1))  #This tells getopts to move on to the next argument.

### End getopts code ###
clear
echo 'executing...'
if $SUDO_RUN;then
 #echo true
 sudo $RUN_THIS
else
 #echo false
 $@
fi 

source ~/.bashrc
spd-say -r 20 -i 100 -t child_female 'You are Awesome and Fantastic! ' #Howla
### Main loop to process files ###

### End main loop ###
#chmod -R a+rX ~/catkin_ws/src/waiterbot/waiterbot/waiterbot_navigation/scripts/*

source ~/.bashrc
#source $FILE_PTH
echo -e "${LGrn}Done.${NC}"
exit 0
