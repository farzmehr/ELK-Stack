#!/bin/bash
# This is the script for the point3 and 4 of the dealer analysis.
# Instead of repeating the comand 13 times. The for loop iterate over each line of the Player_Analysis file and read the date, time and AM/PM of the losses, save it in the date time AMPM variables. Then using the the variable date is used to find the corresponding  dealer find. and the varilables time and date are used to awk the appropriote column
rm ./Dealers_working_during_losses
for ((i=1; i<14; i++))
do
date=$(awk -v rr=$i 'NR==rr {print $1}' ./Notes_Player_Analysis)
time=$(awk -v rr=$i 'NR==rr {print $2}' ./Notes_Player_Analysis)
AMPM=$(awk -v rr=$i 'NR==rr {print $3}' ./Notes_Player_Analysis)
grep "$time $AMPM" ./Dealer_Schedules_0310/"$date"_Dealer_schedule | awk  '{print $1, $2, $5, $6}' 1>> ./Dealers_working_during_losses
done

