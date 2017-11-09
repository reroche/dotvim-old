#!/bin/bash

charging=$(acpi | cut -c 12-19)
percentage=$(acpi|cut -d " " -f 4|cut -c -3)

if [ "$charging" == "Charging" ]
then
  echo "⚡$percentage"
else
  echo $percentage
fi
