#!/bin/bash

########################
#
# Author : Gouri Shinde
#
# Script to print number of SS in a word
#
# Version: v1
#
########################


x=mississipi

grep -o "s" <<<"$x" | wc -l
