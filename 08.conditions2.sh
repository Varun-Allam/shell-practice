#!/bin/bash

echo "enter the num"
read NUMBER 

if [ $(($NUMBER % 2)) -eq 0 ]; then
    echo "Given num $NUMBER is EVEN" 
else 
    echo "Given num $NUMBER is ODD" 
fi