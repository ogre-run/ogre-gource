#!/bin/bash

repo_input=${1}

# Determine folder name
if [[ "$repo_input" =~ ^(https://|git@github.com:).+\.git$ ]]; then
    echo "Input is a valid Git repository URL. Proceeding..."
    folder_name=$(basename -s .git "$repo_input")
elif [ -d "$repo_input" ]; then
    echo "Input is a local path. Skipping cloning..."
    folder_name=$(basename "$repo_input")
else
    echo "Invalid input. Please provide a Git repository URL or a valid local path."
    exit 1
fi

# Clone if it's a remote repository URL
if [[ "$repo_input" =~ ^(https://|git@github.com:).+\.git$ ]]; then
    git clone "$repo_input"
fi

# Navigate to the folder and generate the caption.txt file
if cd "$folder_name"; then
    git log --pretty="%at|%as %s" > ../caption.txt
    echo "caption.txt has been created."
    cd ..
else
    echo "Failed to access the repository folder."
    exit 1
fi

## Input file name
#input_file="caption.txt"
#
## Read each line from the file
#while IFS="|" read -r timestamp date_message; do
#  # Extract the date (second column)
#  date_only=$(echo "$date_message" | cut -d' ' -f1)
#
#  # Convert the date to UNIX timestamp
#  unix_timestamp=$(date -d "$date_only" +%s 2>/dev/null)
#
#  # Print the original timestamp, converted date's timestamp, and message
#  echo "$timestamp|$unix_timestamp|$date_message"
#done < "$input_file"

# Run gource and generate ppm
xvfb-run gource --load-config ./gource.config --title ${folder_name} --disable-input --output-ppm-stream ./output.ppm --path ${folder_name}

# Run ffmpeg and generate final video
ffmpeg -y -r 60 -f image2pipe -vcodec ppm -i output.ppm -vcodec libx264 -preset medium -pix_fmt yuv420p -crf 1 -threads 0 -bf 0 ./gource.x264-${folder_name}.mp4

# Remove ppm
rm output.ppm
