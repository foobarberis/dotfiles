#!/bin/sh

# Define the list of target directories as a space-separated string
TARGET_DIRECTORIES="
    ${HOME}/Code/3PC/3pc-web-back
    ${HOME}/Code/3PC/3pc-web-front
    ${HOME}/Code/3PC/mirrhia-etl
    ${HOME}/Code/3PC/mirrhia-hub
    ${HOME}/Code/3PC/mirrhia-report
"

# Path to the git hook file
HOOK_FILE="prepare-commit-msg"

# Iterate through each directory
for DIR in $TARGET_DIRECTORIES; do
    if [ -d "$DIR/.git" ]; then
        # Copy the hook file to the git hooks directory
        cp "$HOOK_FILE" "$DIR/.git/hooks/"
        chmod +x "$DIR/.git/hooks/"
        echo "Hook deployed to $DIR"
    else
        echo "$DIR is not a git repository"
    fi
done
