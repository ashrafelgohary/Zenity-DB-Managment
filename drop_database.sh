#!/bin/bash

DB_DIR="./databases"

db_name=$(zenity --entry --title="Drop Database" --text="Enter Database Name:")
if [ -z "$db_name" ]; then
    zenity --error --text="Database name cannot be empty."
    exit 1
fi

if [ -d "$DB_DIR/$db_name" ]; then
    if zenity --question --text="Are you sure you want to drop the database '$db_name'?"; then
        rm -rf "$DB_DIR/$db_name"
        zenity --info --text="Database '$db_name' dropped successfully."
    else
        zenity --info --text="Database drop operation canceled."
    fi
else
    zenity --error --text="Database '$db_name' does not exist."
fi

