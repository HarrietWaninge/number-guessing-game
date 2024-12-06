#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=<database_name> -t --no-align -c"
HOLY_NUMBER=$((RANDOM % 1000 + 1 )) 

echo "Enter your username:"
read USER_NAME
