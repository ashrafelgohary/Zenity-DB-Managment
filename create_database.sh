#!/bin/bash

DB_DIR="./databases"

db_name=$(zenity --entry --title="Create Database" --text="Enter Database Name:")
if [ -z "$db_name" ]; then
    zenity --error --text="Database name cannot be empty."
    exit 1
fi

if [ -d "$DB_DIR/$db_name" ]; then
    zenity --error --text="Database '$db_name' already exists."
else
    mkdir -p "$DB_DIR/$db_name"
    zenity --info --text="Database '$db_name' created successfully."
fi

