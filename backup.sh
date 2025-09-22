#!/bin/bash


<<msg

This script will take a periodic backup of this folder


msg


src=$1

dest=$2


timestamp=$(date '+%Y_%m_%d_%H_%M_%S')

zip -r "$dest/backup-$timestamp.zip" "$src" > /dev/null


echo "Backup completed"
