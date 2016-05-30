#!/bin/bash
DIR="/opt/odoo"
FILE="py.txt"
#Find all ascii files
find $DIR -type f -name *.py > $FILE
