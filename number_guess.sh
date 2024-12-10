#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --tuples-only -c"
HOLY_NUMBER=$((RANDOM % 1000 + 1 )) 
NUMBER_OF_TRIES=0
echo $HOLY_NUMBER
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
USER_ID=$($PSQL "select user_id from users where user_name = '$USER_NAME'")

else 
#if found output text
GAMES_RESULTS=$($PSQL "select COUNT(*) AS number_of_games, MIN(number_of_guesses) as best_game, user_name from games full join users using(user_id) where user_id = $USER_ID group by user_name")
echo "$GAMES_RESULTS" | while read NUMBER_OF_GAMES BAR BEST_GAME BAR USER_NAME_DB
do
echo -e "Welcome back, $USER_NAME_DB! You have played $NUMBER_OF_GAMES games, and your best game took $BEST_GAME guesses."
#Welcome back, test! You have played 7 games, and your best game took 1 guesses.
#Welcome back, <use! You have played < games, and your best game took < guesses.
done
fi

GUESSING $USER_ID


}

GUESSING() {
echo "Guess the secret number between 1 and 1000:"
read HOLY_GUESS

USER_ID=$1

if [[ ! $HOLY_GUESS =~ ^[0-9]+$ ]]
then 
echo That is not an integer, guess again:
GUESSING $USER_ID
return
fi

echo "HOLY NUMBER = $HOLY_NUMBER your try was: $HOLY_GUESS"

if [[ $HOLY_GUESS -gt $HOLY_NUMBER ]]
then 
echo "It's lower than that, guess again:"
echo "HOLY NUMBER = $HOLY_NUMBER your try was: $HOLY_GUESS"
((NUMBER_OF_TRIES+=1))
GUESSING $USER_ID
return
elif [[ $HOLY_GUESS -lt $HOLY_NUMBER ]] 
then
echo "It's higher than that, guess again:"
echo "HOLY NUMBER = $HOLY_NUMBER your try was: $HOLY_GUESS"
((NUMBER_OF_TRIES+=1))
GUESSING $USER_ID
return
else 
((NUMBER_OF_TRIES+=1))
INSERT_TRIES_RESULT=$($PSQL "insert into games(user_id, number_of_guesses) values($USER_ID, $NUMBER_OF_TRIES)")
echo "You guessed it in $NUMBER_OF_TRIES tries. The secret number was $HOLY_NUMBER. Nice job!"
#     You guessed it in <number_of_guess tries. The secret number was <secret_numb. Nice job!"
fi  

}


MAIN_MENU