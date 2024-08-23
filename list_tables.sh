#!/bin/bash

DB_PATH=$(cat /tmp/current_db_path.txt)

tables=$(ls "$DB_PATH"/*.txt 2>/dev/null | xargs -n 1 basename | sed 's/\.txt$//')
if [ -n "$tables" ]; then
    zenity --info --text="Tables:\n$tables"
else
    zenity --info --text="No tables found."
fi

