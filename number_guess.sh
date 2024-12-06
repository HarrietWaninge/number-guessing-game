#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
HOLY_NUMBER=$((RANDOM % 1000 + 1 )) 

MAIN_MENU () {

echo "Enter your username:"
read USER_NAME
#search username in database 
USER_QUERY_RESULT=$($PSQL "select * from users full join games using(user_id)")
# select COUNT(*) AS number_of_games from games full join games using(user_id) where user_name = 'test';
if [[ -z $USER_QUERY_RESULT ]]
then 
#if not found 
echo "Welcome, $USER_NAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "insert into users(user_name) values('$USER_NAME')")
else 
#if found output text
echo -e "\nWelcome back, $USER_NAME! You have played <games_played> games, and your best game took <best_game> guesses"
fi


}



MAIN_MENU
