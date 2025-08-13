#!/bin/sh

# Get the current branch name
BRANCH_NAME=$(git branch --show-current)

# Extract the US identifier or use the full branch name if none is found
US_ID=$(echo "$BRANCH_NAME" | awk -F'/' '{if (NF > 1) {split($2, arr, "_"); print arr[1]} else {print $0}}')

# Prepend US_ID to the commit message
echo "${US_ID}: $(cat "$1")" > "$1"
