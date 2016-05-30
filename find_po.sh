#!/bin/bash
DIR="/opt/odoo"
FILE="po.txt"
#Find all ascii files
find $DIR -type f -name *.po > $FILE
