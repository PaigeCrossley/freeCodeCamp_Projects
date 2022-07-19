#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOALS OPPONENT_GOALS
do
  if [[ $YEAR != "year" ]]
  then
    W_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")

    if [[ -z $W_TEAM_ID ]]
    then
      INSERT_W=$($PSQL "INSERT INTO teams(name) VALUES('$WINNER')")
      if [[ $INSERT_W == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $WINNER
      fi

      W_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$WINNER'")
    fi

    O_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")

    if [[ -z $O_TEAM_ID ]]
    then
      INSERT_O=$($PSQL "INSERT INTO teams(name) VALUES('$OPPONENT')")
      if [[ $INSERT_O == "INSERT 0 1" ]]
      then
        echo Inserted into teams, $OPPONENT
      fi

      O_TEAM_ID=$($PSQL "SELECT team_id FROM teams WHERE name='$OPPONENT'")
    fi

    INSERT_GAMES=$($PSQL "INSERT INTO games(year,round,winner_goals,opponent_goals,winner_id,opponent_id) VALUES('$YEAR','$ROUND','$WINNER_GOALS','$OPPONENT_GOALS','$W_TEAM_ID','$O_TEAM_ID')")
    if [[ $INSERT_GAMES == "INSERT 0 1" ]]
      then
        echo Inserted into games, $YEAR $ROUND $WINNER_GOALS $OPPONENT_GOALS $W_TEAM_ID $O_TEAM_ID
      fi
  fi
done
