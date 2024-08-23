# Bash Database Management System (DBMS)

## Overview

The Bash Database Management System (DBMS) is a command-line interface (CLI) application that allows users to manage databases and tables using Bash scripts and Zenity for a graphical interface. This project demonstrates the capability of Bash scripting to perform basic database operations in a simulated environment.

## Features

- **Database Management:**
  - Create and delete databases
  - List available databases
  - Connect to a database

- **Table Management:**
  - Create and delete tables
  - List tables in the current database

- **Data Manipulation:**
  - Insert, select, update, and delete records in tables

- **User Interaction:**
  - Utilize Zenity for a graphical interface for ease of use

## Getting Started

### Prerequisites

Ensure you have the following installed on your system:

- **Bash** (typically installed by default on Unix-based systems)
- **Zenity** (for the graphical interface)

### Installation

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/ashrafelgohary/Zenity-DB-Managment.git
2. **Navigate to the Project Directory:**

   ```bash
   cd Zenity-DB-Managment
3. **Make Scripts Executable:**

     ```bash
     chmod +x *.sh

### Usage

1. **Run the Main Script:**
     - Start the application by running the main.sh script:
            ```bash
       
             .main.sh

2. **Interact with the Application:**

      - Follow the on-screen prompts provided by Zenity to manage databases and tables.


## Script Descriptions

- **`main.sh`**: The entry point of the application, providing the main menu to access different functionalities.
- **`create_database.sh`**: Script to create a new database.
- **`list_databases.sh`**: Script to list all available databases.
- **`connect_to_database.sh`**: Script to connect to a selected database.
- **`drop_database.sh`**: Script to delete an existing database.
- **`create_table.sh`**: Script to create a new table within the connected database.
- **`list_tables.sh`**: Script to list all tables in the current database.
- **`drop_table.sh`**: Script to delete a table from the current database.
- **`insert_into_table.sh`**: Script to insert a new row into a specified table.
- **`select_from_table.sh`**: Script to view rows from a specified table.
- **`delete_from_table.sh`**: Script to delete rows from a table based on a condition.
- **`update_table.sh`**: Script to update rows in a table based on a condition.
- **`disconnect.sh`**: Script to disconnect from the current database.

## Examples

### Creating a Database

1. Select **"Create Database"** from the main menu.
2. Enter the desired database name.

### Inserting Data into a Table

1. Connect to a database.
2. Select **"Insert into Table"** from the database menu.
3. Enter the table name and the values for each column.

## Acknowledgements
  - Zenity for providing a simple graphical interface for Bash scripts.
