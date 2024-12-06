pg_dump -cC --inserts -U freecodecamp number_guess > number_guess.sql


git add .

if [[ ! -z $1 ]]
then 
git commit "$1" 
echo "committed with message $1"
fi

echo "nothing commited"
git status