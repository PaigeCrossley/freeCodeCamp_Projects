#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

CHECK() {
  if [[ -z $ELEM ]]
  then
    echo "I could not find that element in the database."
    exit
  fi
}

if [[ -z $1 ]]
then
  echo Please provide an element as an argument.
else
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEM=$($PSQL "SELECT * FROM elements WHERE atomic_number = $1")
    CHECK
  else
    ELEM=$($PSQL "SELECT * FROM elements WHERE symbol = '$1' OR name = '$1'")
    CHECK
  fi
  echo $ELEM | while read ATM_NUM bar SYMBOL bar NAME
  do
    PROP=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATM_NUM")
    echo $PROP | while read ATM_NUM_P bar ATM_M bar MP bar BP bar TYPE_ID
    do
      TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID" | sed -e 's/ //')
      echo -e "The element with atomic number $ATM_NUM is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATM_M amu. $NAME has a melting point of $MP celsius and a boiling point of $BP celsius."
    done
  done
fi
