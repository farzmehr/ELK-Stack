#!/bin/bash
# The scripts gets time, AM/PM and date and it will give the exact time of the roulette and the dealer's name.
# examples:
# bash ./roulette_dealer_finder_by_time.sh 5 pm 0312
# bash ./roulette_dealer_finder_by_time.sh 3 am 0316
# Note: I have copied the Dealer\_Schedules\_0310 in the folder that you run this file. The folder Dealer\_Schedules\_0310 contains all of the days. So you can enter any number from 0310 to 0317 as the date. Folder Dealer\_Schedules\_0310 should be in the same location that you run this script.
grep -i "$1:00:00 $2" ./Dealer_Schedules_0310/$3_Dealer_schedule | awk '{print $1, $2, $5, $6}' | cowsay
