#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

#Random function to obtein a number between A and B
RANDOM() {
  local A=1
  local B=1000
  echo $(( RANDOM % (B - A + 1) + A ))
}

MAIN() {
  #ask for the username
  echo -e "\nEnter your username:"
  read USERNAME

  #get username from the database
  _USERNAME=$($PSQL "SELECT username FROM user_guess_game WHERE username='$USERNAME';")
  
  if [[ -z $_USERNAME ]]
  then
    #the user is not in the database
    echo -e "\nWelcome, $USERNAME! It looks like this is your first time here."
  else
    #the user is in the database
    GAMES_PLAYED=$($PSQL "SELECT COUNT(username) FROM guess_game WHERE username='$_USERNAME';")
    BEST_GAME=$($PSQL "SELECT MIN(guesses) FROM guess_game WHERE username='$_USERNAME';")

    #prit the welcome back to the user
    echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
  fi

  #get the random number as secret number
  SECRET_NUMBER=$(RANDOM)

  #number of tries to guess the secret number
  GUESSING_TRIES=0

  #ask for a guess
  echo -e "\nGuess the secret number between 1 and 1000:"


  while true
  do
    read GUESSED_NUMBER

    if [[ ! $GUESSED_NUMBER =~ ^[0-9]+$ ]]
    then 
      echo -e "\nThat is not an integer, guess again:"

    else
      #increment the guessing tries
      (( GUESSING_TRIES++ )) 

      if [[ $SECRET_NUMBER == $GUESSED_NUMBER ]]
      then
        echo -e "\nYou guessed it in $GUESSING_TRIES tries. The secret number was $SECRET_NUMBER. Nice job!"
      else
        if [[ $GUESSED_NUMBER > $SECRET_NUMBER ]]
        then
          echo -e "\nIt's lower than that, guess again:"
        else
          echo -e "\nIt's higher than that, guess again:"
        fi
      fi
    fi
  done

}

MAIN