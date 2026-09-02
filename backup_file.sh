#!/bin/bash

SOURCE_DIR="/workspaces/cronjobs/file.db" 

BACKUP_DIR="$HOME/backups"   
TIMESTAMP=$(date +%F-%H-%M)    # e.g., 2025-06-12-14-30
BACKUP_NAME="documents-$TIMESTAMP.tar.gz" # Backup filename

touch $SOURCE_DIR
mkdir -p "$BACKUP_DIR"
tar -czf "$BACKUP_DIR/$BACKUP_NAME" "$SOURCE_DIR"
# === CLEANUP OLD BACKUPS (older than 7 days) ===
find "$BACKUP_DIR" -type f -name "*.tar.gz" -mtime +7 -delete

echo "Backup completed: $BACKUP_DIR/$BACKUP_NAME" 