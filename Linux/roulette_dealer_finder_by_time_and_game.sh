#!bin/bash
# The script gets time am/pm date (0310-0317) and the game NAME
# NOTE: The script is very robust in terms of getting a game name. You should enter the game name or just part of the game name: roulette, black jack or texas hold em and also anything like, blackjack, black jack, BLACKJACK, bla, black, Roulette, roul, roulette, texa, tex, texas hol, texas hold em work, too.
# examples
# bash ./roulette_dealer_finder_by_time_and_game.sh 3 am 0316 black jack
# bash ./roulette_dealer_finder_by_time_and_game.sh 3 am 0316 blac
# bash ./roulette_dealer_finder_by_time_and_game.sh 3 am 0316 roule
# bash ./roulette_dealer_finder_by_time_and_game.sh 5 pm 0312 Roulette
# bash ./roulette_dealer_finder_by_time_and_game.sh 8 pm 0313 texas
# bash ./roulette_dealer_finder_by_time_and_game.sh 11 pm 0314 texas hold
# bash ./roulette_dealer_finder_by_time_and_game.sh 11 pm 0314 TexA

# Algorithm:  The script iterates over the first line of the file (NR==1) using a for loop. Then if the game name is matched with the field it saves field number of that field as the iGame. The using the the variable date it finds the file and using the time and am/pm it finds the dealer.

#I have copied the Dealer\_Schedules\_0310 in the folder that you run this file. The folder Dealer\_Schedules\_0310 contains all of the days. So you can enter any number from 0310 to 0317 as the date. Folder Dealer\_Schedules\_0310 should be in the same location that you run this script.

iGame=$(awk -v gg="$4" 'NR==1{for (i=3; i<NF; ++i) {if(tolower($i) ~ tolower(gg)){print i}}}' ./Dealer_Schedules_0310/$3_Dealer_schedule)
grep -i "$1:00:00 $2" ./Dealer_Schedules_0310/$3_Dealer_schedule | awk -v game=$iGame '{print $1, $2, $game, $(game+1)}' | cowsay
