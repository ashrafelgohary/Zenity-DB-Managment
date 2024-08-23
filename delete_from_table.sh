#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Delete From Table" --text="Enter Table Name:")
if [ -f "$DB_PATH/$table_name.txt" ]; then
    condition=$(zenity --entry --title="Delete From Table" --text="Enter condition (e.g., id=1):")
    if [ -n "$condition" ]; then
        header=$(head -n 1 "$DB_PATH/$table_name.txt")
        condition_col=$(echo "$condition" | cut -d'=' -f1)
        condition_val=$(echo "$condition" | cut -d'=' -f2)
        col_num=$(echo "$header" | tr ',' '\n' | grep -n "^$condition_col" | cut -d':' -f1)
        awk -F, -v col="$col_num" -v val="$condition_val" '$col != val' "$DB_PATH/$table_name.txt" > "$DB_PATH/${table_name}_temp.txt"
        mv "$DB_PATH/${table_name}_temp.txt" "$DB_PATH/$table_name.txt"
        zenity --info --text="Row(s) deleted successfully."
    else
        zenity --error --text="Condition cannot be empty. Deletion canceled."
    fi
else
    zenity --error --text="Table '$table_name' does not exist."
fi

