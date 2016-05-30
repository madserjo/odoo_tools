#!/bin/bash
DIR="/opt/odoo"
FILE="xml.txt"
#Find all ascii files
find $DIR -type f -name *.xml > $FILE
