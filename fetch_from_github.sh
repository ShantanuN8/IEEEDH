#!/bin/bash

# Define the directory where the HTML and CSS files will be stored temporarily
temp_dir="/tmp/static-webpage"

# Clone the GitHub repository containing HTML and CSS files
git clone "$github_repo" "$temp_dir"

# Check if the clone operation was successful
if [ $? -ne 0 ]; then
    echo "Failed to clone the GitHub repository. Exiting."
    exit 1
fi

# Define the Lambda deployment directory
lambda_dir="/var/task"

# Copy HTML and CSS files to the Lambda deployment directory
cp "$temp_dir/index.html" "$lambda_dir/"
cp "$temp_dir/style.css" "$lambda_dir/"

# Check if the copy operation was successful
if [ $? -ne 0 ]; then
    echo "Failed to copy HTML and CSS files to the Lambda deployment directory. Exiting."
    exit 1
fi

# Clean up the temporary directory
rm -rf "$temp_dir"

# Exit with success status
exit 0
