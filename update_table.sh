#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

table_name=$(zenity --entry --title="Update Table" --text="Enter Table Name:")
if [ -f "$DB_PATH/$table_name.txt" ]; then
    condition=$(zenity --entry --title="Update Table" --text="Enter condition (e.g., id=1):")
    updates=$(zenity --entry --title="Update Table" --text="Enter updates (e.g., name=John):")
    if [ -n "$condition" ] && [ -n "$updates" ]; then
        header=$(head -n 1 "$DB_PATH/$table_name.txt")
        condition_col=$(echo "$condition" | cut -d'=' -f1)
        condition_val=$(echo "$condition" | cut -d'=' -f2)
        col_num=$(echo "$header" | tr ',' '\n' | grep -n "^$condition_col" | cut -d':' -f1)
        awk -F, -v col="$col_num" -v val="$condition_val" -v updates="$updates" '
        BEGIN {split(updates, upd, "="); upd_col=upd[1]; upd_val=upd[2];}
        $col == val {$col_num=upd_val}1' "$DB_PATH/$table_name.txt" > "$DB_PATH/${table_name}_temp.txt"
        mv "$DB_PATH/${table_name}_temp.txt" "$DB_PATH/$table_name.txt"
        zenity --info --text="Row(s) updated successfully."
    else
        zenity --error --text="Condition or updates cannot be empty. Update canceled."
    fi
else
    zenity --error --text="Table '$table_name' does not exist."
fi

