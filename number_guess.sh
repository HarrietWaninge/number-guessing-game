#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
HOLY_NUMBER=$((RANDOM % 1000 + 1 )) 

MAIN_MENU () {

echo "Enter your username:"
read USER_NAME
#search username in database 
USER_ID=$($PSQL "select user_id from users full join games using(user_id) where user_name = '$USER_NAME'")
# ;
if [[ -z $USER_ID ]]
then 
#if not found 
echo "Welcome, $USER_NAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "insert into users(user_name) values('$USER_NAME')")
else 
#if found output text
GAMES_RESULTS=$($PSQL "select COUNT(*) AS number_of_games, MIN(games.number_of_guesses) as best_game from games where user_id = $USER_ID")
echo "$GAMES_RESULTS" | while read NUMBER_OF_GAMES BAR BEST_GAME
do
if [[ -z $BEST_GAME  ]]
then 
echo -e "\nWelcome back, $USER_NAME! You haven't played any games yet, but let's change that!"
else
echo -e "\nWelcome back, $USER_NAME! You have played $NUMBER_OF_GAMES games, and your best game took  $BEST_GAME ? $BEST_GAME guesses"
fi 

done
fi


}



MAIN_MENU
