#!/bin/bash

#Set Script Name variable
SCRIPT=`basename ${BASH_SOURCE[0]}`


sed -i 's/[[:space:]]*$//' $1
