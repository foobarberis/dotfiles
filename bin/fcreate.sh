#!/bin/sh
# FIXME: Add delimiter to tags i.e :meta: or [meta].
# FIXME: Generate a list of existing tags to make selection easier.
#
# Generate a unique identifier using the current date and time in the desired format
unique_id=$(date +"%Y%m%dT%H%M%S")

# Prompt the user for the title and tags
read -p "Enter the title: " title
read -p "Enter tags (separated by spaces): " tags

# Transform the title to lowercase and replace spaces with hyphens
formatted_title=$(echo "$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')

# Transform the tags to lowercase and join them with double underscores
formatted_tags=$(echo "$tags" | tr '[:upper:]' '[:lower:]' | tr ' ' '__')

# Create the filename
filename="${unique_id}--${formatted_title}__${formatted_tags}.txt"

# Generate the current date in the desired format for the heading
current_date=$(date +"[%Y-%m-%d %a %H:%M]")

# Create the file and insert the heading
echo "title:      $title
date:       $current_date
filetags:   $tags
identifier: $unique_id
----------------------------------
" > "$filename"

# Output the generated filename
echo "File created: $filename"

