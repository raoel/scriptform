#!/bin/sh

if [ -z "$csv_file" ]; then
    echo "No file specified" >&2
    exit 1
fi

{
    echo ".separator ,"
    echo ".import $csv_file employee"
} | sqlite3 megacorp.db
if [ $? -eq 0 ]; then
    echo "Succesfully loaded employees"
else
    echo "Failed to load employees. Maybe you should clean the database first?"
fi
