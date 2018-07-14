#!/bin/bash

######################################################################
#Author: Jason
######################################################################

BLACKLIST_PACKAGES="teleop_twist_keyboard;amcl;move_base;lms1xx;waiterbot_bringup;roboteq_diagnostics;roboteq_driver;roboteq_msgs"

#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`

#Initialize variables to default values.
MAKE_OPT="" #normal  

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
  echo -e "${LBlu}-r${Yel}  --Remove devel/ build/ before make${NC}."
  echo -e "${LBlu}-a${Yel}  --All Build${NC}."
  #echo -e "${REV}-h${NORM}  --Displays this help message. No further functions are performed."\\n
  #echo -e "Example: ${BOLD}$SCRIPT -a foo -b man -c chu -d bar file.ext${NORM}"\\n
  exit 1
}

### Start getopts code ###

#Parse command line flags
#If an option should be followed by an argument, it should be followed by a ":".
#Notice there is no ":" after "h". The leading ":" suppresses error messages from
#getopts. This is required to get my unrecognized option code to work.

while getopts :rah FLAG; do
  case $FLAG in
    r)  #set option "r"
      #OPT_A=$OPTARG
      echo -e "${Yel}Removing build/ and devel/..${NC}"
      cd ~/catkin_ws/
      rm -rf build/ devel/
      
      ;;
    a)
      #MAKE_OPT="light"
      
      BLACKLIST_PACKAGES=""
      echo "All build. Included packages are: $BLACKLIST_PACKAGES" 
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

### Main loop to process files ###
cd ~/catkin_ws

catkin_make -DCATKIN_BLACKLIST_PACKAGES=$BLACKLIST_PACKAGES

echo -e "${LGrn}Done.${NC}"
exit 0
