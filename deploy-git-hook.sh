# Define the list of target directories
TARGET_DIRECTORIES="
    ${FOLDER_3PC}/3pc-web-back
    ${FOLDER_3PC}/3pc-devops
    ${FOLDER_3PC}/3pc-web-front
    ${FOLDER_3PC}/3pc-installer
    ${FOLDER_3PC}/mirrhia-etl
    ${FOLDER_3PC}/mirrhia-hub
    ${FOLDER_3PC}/mirrhia-report
    ${FOLDER_3PC}/microbio-connectivity
"

# Path to the Git hook file
HOOK_FILE="./bin/prepare-commit-msg"

# Iterate through each directory and deploy the Git hook
for DIR in $TARGET_DIRECTORIES; do
    if [ ! -d "$DIR" ]; then
        continue
    fi

    if [ -d "$DIR/.git" ]; then
        cp "$HOOK_FILE" "$DIR/.git/hooks/"
        chmod +x "$DIR/.git/hooks/prepare-commit-msg"
        echo "Hook deployed to $DIR"
    else
        echo "$DIR is not a Git repository"
    fi
done
