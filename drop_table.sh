#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Drop Table" --text="Enter Table Name to Drop:")
if [ -z "$table_name" ]; then
    zenity --error --text="Table name cannot be empty."
    exit 1
fi

if [ -f "$DB_PATH/$table_name.txt" ]; then
    if zenity --question --text="Are you sure you want to drop the table '$table_name'?"; then
        rm -f "$DB_PATH/$table_name.txt"
        zenity --info --text="Table '$table_name' dropped successfully."
    else
        zenity --info --text="Table drop operation canceled."
    fi
else
    zenity --error --text="Table '$table_name' does not exist."
fi

