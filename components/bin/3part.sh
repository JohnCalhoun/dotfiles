#! /bin/bash


TEMPLATE_DIR=~/documents/templates
TEMPLATE=$TEMPLATE_DIR/3part.otl
NAME=temp.otl

DESTINATION=. 

echo "Copying $TEMPLATE to $DESTINATION"
cp $TEMPLATE $DESTINATION/$NAME 
