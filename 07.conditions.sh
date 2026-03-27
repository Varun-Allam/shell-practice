#!/bin/bash

NUMBER=$1

if [ "$NUMBER" -lt 10 ]; then
    echo "Given num $NUMBER is less than 10" 
elif [ "$NUMBER" -gt 10 ]; then
    echo "Given num $NUMBER is greater than 10" 
else
    echo "Given num $NUMBER is Equal to 10" 
fi