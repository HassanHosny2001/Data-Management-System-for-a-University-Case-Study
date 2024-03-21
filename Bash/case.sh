#!/bin/bash

# database credentials
database_user="university"
database_password="123"
database_name="xe"

# the backup directory
backup_directory="/d/database/backups/"

# Check and create backup directory if it doesn't exist
if [ ! -d "$backup_directory" ]; then
    mkdir -p "$backup_directory"
    echo "backup dir done"
fi

logs_directory="/d/database/logs"

if [ ! -d "$logs_directory" ]; then
    mkdir -p "$logs_directory"
    echo "logs dir done"
fi

# making logs file
database_logs="database/logs/database_logs.log"

log_message() {
    local log_type="$1"
    local message="$2"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [$log_type] $message" >> "$database_logs"
}

# timestamp
timestamp=$(date +%Y%m%d_H%M%S)

# setting the backup filename
backup_filename="${database_user}_${timestamp}.sql"


# the actual backup command
if exp "${database_user}/${database_password}@${database_name}" FILE="${backup_directory}/${backup_filename}" > "${backup_directory}/${backup_filename}"; then
    log_message "INFO" "Backup completed successfully to: ${backup_directory}/${backup_filename}"
else
    log_message "ERROR" "Backup failed. Check the logs for details."
fi


threshold=85

# Extract only the numeric part of the disk usage
disk_usage=$(df -h | awk 'NR == 3 {sub(/%/, "", $5); print $5}')

# Check if the disk usage exceeds the threshold
if [ "$disk_usage" -gt "$threshold" ]; then
    echo "Disk is running out of space soon! Currently using $disk_usage%."
    log_message "WARNING"  "Disk is running out of space soon! Currently using $disk_usage%."
else
    echo "The available disk space is okay (less than 85% is used). Currently using $disk_usage%."
    log_message "INFO"  "The available disk space is okay (less than 70% is used). Currently using $disk_usage%."
fi
