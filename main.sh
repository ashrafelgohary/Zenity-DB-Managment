#!/bin/bash

# Function to show a message
show_message() {
    zenity --info --text="$1"
}

# Main Menu
while true; do
    choice=$(zenity --list --title="Main Menu" --column="Option" --column="Action" \
        1 "Create Database" \
        2 "List Databases" \
        3 "Connect To Database" \
        4 "Drop Database" \
        5 "Exit")

    if [ $? -ne 0 ]; then
        break
    fi

    case $choice in
        1)
            ./create_database.sh
            ;;
        2)
            ./list_databases.sh
            ;;
        3)
            ./connect_to_database.sh
            if [ $? -eq 0 ]; then
                while true; do
                    choice=$(zenity --list --title="Database Menu" --column="Option" --column="Action" \
                        1 "Create Table" \
                        2 "List Tables" \
                        3 "Drop Table" \
                        4 "Insert into Table" \
                        5 "Select From Table" \
                        6 "Delete From Table" \
                        7 "Update Table" \
                        8 "Disconnect")

                    if [ $? -ne 0 ]; then
                        break
                    fi

                    case $choice in
                        1)
                            ./create_table.sh
                            ;;
                        2)
                            ./list_tables.sh
                            ;;
                        3)
                            ./drop_table.sh
                            ;;
                        4)
                            ./insert_into_table.sh
                            ;;
                        5)
                            ./select_from_table.sh
                            ;;
                        6)
                            ./delete_from_table.sh
                            ;;
                        7)
                            ./update_table.sh
                            ;;
                        8)
                            ./disconnect.sh
                            break
                            ;;
                        *)
                            show_message "Invalid option. Please try again."
                            ;;
                    esac
                done
            fi
            ;;
        4)
            ./drop_database.sh
            ;;
        5)
            exit 0
            ;;
        *)
            show_message "Invalid option. Please try again."
            ;;
    esac
done

