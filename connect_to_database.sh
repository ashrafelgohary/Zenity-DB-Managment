#!/bin/bash

DB_DIR="./databases"

db_name=$(zenity --entry --title="Connect To Database" --text="Enter Database Name:")
if [ -d "$DB_DIR/$db_name" ]; then
    echo "$DB_DIR/$db_name" > /tmp/current_db_path.txt
    zenity --info --text="Connected to database '$db_name'."
    exit 0
else
    zenity --error --text="Database '$db_name' does not exist."
    exit 1
fi

