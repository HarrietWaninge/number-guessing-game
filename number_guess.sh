#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
HOLY_NUMBER=$((RANDOM % 1000 + 1 )) 

MAIN_MENU () {

echo "Enter your username:"
read USER_NAME
#search username in database 
USER_ID=$($PSQL "select user_id from users where user_name = '$USER_NAME'")
if [[ -z $USER_ID ]]
then 
#if not found 
echo "Welcome, $USER_NAME! It looks like this is your first time here."
INSERT_USER_RESULT=$($PSQL "insert into users(user_name) values('$USER_NAME')")
else 
#if found output text
GAMES_RESULTS=$($PSQL "select COUNT(*) AS number_of_games, MIN(number_of_guesses) as best_game from games where user_id = $USER_ID")
echo "$GAMES_RESULTS" | while read NUMBER_OF_GAMES BAR BEST_GAME
do
echo -e "Welcome back, $USER_NAME! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
done
fi

echo "Guess the secret number between 1 and 1000:"
read HOLY_GUESS



if [[ ! $HOLY_GUESS =~ ^[0-9]+$ ]]
then 
echo That is not an integer, guess again:
read HOLY_GUESS
fi

NUMBER_OF_TRIES=0

if [[ $HOLY_GUESS > $HOLY_NUMBER ]]
then 
echo "It's lower than that, guess again:"
((NUMBER_OF_TRIES++))
echo "$NUMBER_OF_TRIES"
read HOLY_GUESS
elif [[ $HOLY_GUESS < $HOLY_NUMBER ]] 
then
echo "It's higher than that, guess again:"
read HOLY_GUESS
else 
echo "You guessed it in <number_of_guesses> tries. The secret number was <secret_number>. Nice job!"
fi
}



MAIN_MENU
