#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Create Table" --text="Enter Table Name:")
if [ -z "$table_name" ]; then
    zenity --error --text="Table name cannot be empty."
    exit 1
fi

if [ -f "$DB_PATH/$table_name.txt" ]; then
    zenity --error --text="Table '$table_name' already exists."
else
    columns=$(zenity --entry --title="Define Columns" --text="Enter Columns (name:type, e.g., id:int,name:string):")
    if [ -n "$columns" ]; then
        echo "$columns" > "$DB_PATH/$table_name.txt"
        zenity --info --text="Table '$table_name' created successfully."
    else
        zenity --error --text="No columns defined. Table creation canceled."
    fi
fi

