#!/bin/bash

while true
do
  read -r -p "Are you sure you want to run this script? [Y/n] " input

  case $input in
    [yY][eE][sS]|[yY])
  bash installer.sh
  break
;;
    [nN][oO]|[nN])
  echo "Install cancelled"
  break
         ;;
      *)
  echo "Invalid input..."
  ;;
  esac
done
