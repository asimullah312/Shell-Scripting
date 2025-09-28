#!/bin/bash


<<msg
Script Name: backup_with_rotation.sh
Description: This script creates a compressed backup of a given folder
and implements a rotation mechanism to keep only the
latest N backups (default = 5)


msg

#source and destination 


src="/home/ubuntu/scripting"

dest="/home/ubuntu/backups"


timestamp=$(date '+%Y_%m_%d_%H_%M_%S')

zip -r "$dest/backup-$timestamp.zip" "$src" > /dev/null


echo "Backup completed"


<<msg2 
	rotation part

msg2


max_backup=5

backup_count=$( ls -1 "$dest"/backup-*.zip 2>/dev/null | wc -l)

if [ "$backup_count" -gt "$max_backup" ]; then
	ls -1t "$dest"/backup-*.zip | tail -n +$((max_backup+1)) |xargs rm -f

	echo "old backup removed. only last $max_backup kept."
fi




