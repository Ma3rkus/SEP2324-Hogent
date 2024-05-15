#!/bin/bash

source_dir="/vagrant/configsNetwork/"
destination_dir="/var/lib/tftpboot/"

# Find new files in the source directory (files that have been modified in the last minute)
new_files=$(find "$source_dir" -type f -mmin -1)

# Copy new files to the destination directory
if [ -n "$new_files" ]; then
    rsync -av --ignore-existing "$source_dir" "$destination_dir"
fi

find /var/lib/tftpboot -type f -exec chmod 777 {} \;
chown -R nobody: /var/lib/tftpboot