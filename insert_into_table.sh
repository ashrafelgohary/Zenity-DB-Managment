#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Insert into Table" --text="Enter Table Name:")
if [ -f "$DB_PATH/$table_name.txt" ]; then
    header=$(head -n 1 "$DB_PATH/$table_name.txt")
    IFS=',' read -r -a columns <<< "$header"
    row=""
    for col in "${columns[@]}"; do
        IFS=':' read -r -a col_parts <<< "$col"
        value=$(zenity --entry --title="Insert into Table" --text="Enter value for ${col_parts[0]} (${col_parts[1]}):")
        if [ -n "$value" ]; then
            row="$row$value,"
        else
            zenity --error --text="Value cannot be empty. Insertion canceled."
            exit 1
        fi
    done
    if [ -n "$row" ]; then
        echo "${row%,}" >> "$DB_PATH/$table_name.txt"
        zenity --info --text="Row inserted successfully."
    fi
else
    zenity --error --text="Table '$table_name' does not exist."
fi

