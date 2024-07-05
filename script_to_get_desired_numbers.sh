#!/bin/bash

########################
#
# Author : Gouri Shinde
#
# Script to write numbers divided by 3 and 5 but not by 15
#
# Version: v1
#
########################

echo "Number which are divided by 3 and 5 but not by 15 are as below: "
for i in {1..100}; do

   if ([ `expr $i % 3` == 0 ] || [ `expr $i % 5` == 0 ]) && [ `expr $i % 15` != 0 ];
   then
	echo $i
   fi;
done
