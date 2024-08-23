#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Select From Table" --text="Enter Table Name:")
if [ -f "$DB_PATH/$table_name.txt" ]; then
    content=$(column -t -s',' "$DB_PATH/$table_name.txt")
    zenity --info --text="Content of '$table_name':\n$content"
else
    zenity --error --text="Table '$table_name' does not exist."
fi

