#!/bin/bash

db="dev.db"
# rm -f ${db}
touch ${db}

sqlite3 ${db} < flashcards.sql
