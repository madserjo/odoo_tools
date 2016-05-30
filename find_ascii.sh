#!/bin/bash
DIR="/opt/odoo"
FILE="files.txt"
#Find all ascii files
find $DIR -type f -print0 | xargs -0r file | grep 'ASCII' | awk -F: '{print $1}' > $FILE

