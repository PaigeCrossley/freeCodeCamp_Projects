#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess --tuples-only -c"
NUM_TRIES=1
NUM=$(( $RANDOM % 1000 + 1 ))

echo -e "\n~~~~~ Welcome to the Number Guesser ~~~~~\n"

UPDATE_DB() {
  
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM users WHERE username = '$USERNAME'")

  BEST_GAME=$($PSQL "SELECT best_game FROM users WHERE username = '$USERNAME'")

  UPDATE_GP=$($PSQL "UPDATE users SET games_played = $(( $GAMES_PLAYED + 1 )) WHERE username = '$USERNAME'")

  if (( $BEST_GAME > $1 )) || (( $BEST_GAME == 0 ))
  then
    UPDATE_BG=$($PSQL "UPDATE users SET best_game = $1 WHERE username = '$USERNAME'")
  fi
}

NUM_GUESS() {

  read GUESS

  if ! [[ $GUESS =~ ^[0-9]+$ ]]
  then
    echo -e "That is not an integer, guess again:"

    NUM_GUESS
  else
    if (( $GUESS == $NUM ))
    then
      echo "You guessed it in $NUM_TRIES tries. The secret number was $NUM. Nice job!"
      UPDATE_DB $NUM_TRIES
    elif (( $GUESS > $NUM ))
    then
      echo "It's lower than that, guess again:"
      NUM_TRIES=$(( $NUM_TRIES + 1 ))
      NUM_GUESS
    elif (( $GUESS < $NUM ))
    then
      echo "It's higher than that, guess again:"
      NUM_TRIES=$(( $NUM_TRIES + 1 ))
      NUM_GUESS
    fi
  fi
}

USERS() {
  echo Enter your username:

  read USERNAME

  USER=$($PSQL "SELECT games_played,best_game FROM users WHERE username = '$USERNAME'")

  if [[ -z $USER ]]
  then
    echo -e '\n'"Welcome, $USERNAME! It looks like this is your first time here."

    NEW_USER=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")

    echo -e '\n'"Guess the secret number between 1 and 1000:"

    NUM_GUESS
  else
    echo $USER | while read NUM_GAMES bar BEST_GAME
    do
      echo -e '\n'"Welcome back, $USERNAME! You have played $NUM_GAMES games, and your best game took $BEST_GAME guesses."
    done

    echo -e '\n'"Guess the secret number between 1 and 1000:"

    NUM_GUESS
  fi
}

USERS
