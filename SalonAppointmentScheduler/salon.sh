#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e '\n~~~~~ Welcome to the Salon ~~~~~'

SERVICE() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  SERVICE_LIST=$($PSQL "SELECT service_id, name FROM services WHERE name IS NOT NULL ORDER BY service_id")

  echo -e '\nWhich service would you like today?'

  echo "$SERVICE_LIST" | while read SERVICE_ID BAR NAME
  do
    echo -e "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED

  case $SERVICE_ID_SELECTED in
    1) APPT "cut" ;;
    2) APPT "color" ;;
    3) APPT "wash" ;;
    *) SERVICE "Please enter a valid option" ;;
  esac
}

APPT() {
  echo -e "\nWhat's your phone number?"

  read CUSTOMER_PHONE

  CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  if [[ -z $CUSTOMER_ID ]]
  then
    echo -e "\nIt seems you're not in our system, what's your name?"

    read CUSTOMER_NAME

    NEW_CUSTOMER=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE')")

    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE'")
  fi

  echo -e "\nWhat time would you like to have your appointment?"

  read SERVICE_TIME

  CUSTOMER=$($PSQL "SELECT name FROM customers WHERE phone='$CUSTOMER_PHONE'")

  APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")
  if [[ $APPOINTMENT == "INSERT 0 1" ]]
  then
    echo -e '\n'I have put you down for a $1 at $SERVICE_TIME, $CUSTOMER.
    EXIT
  fi
}

EXIT() {
  echo -e '\nThank you for stopping in.\n'
}

SERVICE
