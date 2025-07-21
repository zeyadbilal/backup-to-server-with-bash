#!/bin/bash

# variables
SOURCE_DIR="/home/zeyad/Desktop/bash/data.txt"
LOG_FILE="backup.log"
REMOTE_HOST="zizo@192.168.1.45"
REMOTE_DIR="/home/zizo/Desktop/zeyad"

# functions
perform_backup(){
    echo "----- $(date) -----" >> "$LOG_FILE"
    rsync -e "ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no -o IdentitiesOnly=yes" -avz "$SOURCE_DIR" "${REMOTE_HOST}:${REMOTE_DIR}" >> "$LOG_FILE" 2>&1
    if [ $? -eq 0 ]; then
        echo "✅ Backup completed successfully at $(date)" >> "$LOG_FILE"
    else
        echo "❌ Backup failed at $(date)" >> "$LOG_FILE"
    fi
}

# run the backup
perform_backup
