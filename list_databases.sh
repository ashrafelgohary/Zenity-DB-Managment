#!/bin/bash

DB_DIR="./databases"

databases=$(ls "$DB_DIR")
if [ -n "$databases" ]; then
    zenity --info --text="Databases:\n$databases"
else
    zenity --info --text="No databases found."
fi

