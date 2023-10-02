#!/bin/bash

# Check if the script is running with sudo
if [ "$EUID" -ne 0 ]; then
    echo "Error: This script must be run with sudo privileges."
    exit 1
fi

# Source files (the utility scripts)
source_file_1="cpyfile"
source_file_2="gitauto"

# Destination directory (/usr/bin/)
destination_directory="/usr/bin/"

# Function to check if the source file exists
function check_source_file() {
    if [ ! -e "$1" ]; then
        echo "Error: The source file '$1' does not exist."
        exit 1
    fi
    echo "File '$1' is present."
}

# Function to add a source file to /usr/bin/
function add_source_file() {
    local source_file="$1"
    echo "Do you want to install '$source_file' ? Enter 'y' for yes, 'n' for no, or 'q' to quit."
    read -r response
    while [ "$response" != "y" ] && [ "$response" != "n" ] && [ "$response" != "q" ]; do
        read -rp "Incorrect input. Only 'y', 'n', or 'q' are accepted. Please enter again: " response
    done
    if [ "$response" == "q" ]; then
        exit 0
    elif [ "$response" == "y" ]; then
        # Check if the destination directory exists
        if [ ! -d "$destination_directory" ]; then
            echo "Error: The destination directory '$destination_directory' does not exist."
            exit 1
        fi
        # Destination path (combined destination directory and source filename)
        destination_path="$destination_directory$source_file"
        # Check if the destination file already exists
        if [ -e "$destination_path" ]; then
            echo "Error: The destination file '$destination_path' already exists."
            exit 1
        fi
        # Copy the source file to the destination directory
        cp "$source_file" "$destination_path"
        # Make the copied file executable
        chmod +x "$destination_path"
        echo "'$source_file' has been copied to '$destination_path' and made executable."
    fi
}

# Check and add each source file
check_source_file "$source_file_1"
add_source_file "$source_file_1"
check_source_file "$source_file_2"
add_source_file "$source_file_2"
