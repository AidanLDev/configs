#!/bin/bash
# Define paths
LOCAL_PATH="$HOME/OneDrive"
REMOTE="onedrive:"
LOG_FILE="$HOME/.cache/rclone/onedrive-sync.log"
CHECK_FILE="/tmp/rclone-onedrive-bisync-check.txt"

# Create log directory if it doesn't exist
mkdir -p "$(dirname "$LOG_FILE")"

# Create the check file if it doesn't exist
echo "Access check file for rclone bisync" > "$CHECK_FILE"

# Check if we need to resync by looking for listing files
if [ ! -f "$HOME/.cache/rclone/bisync/home_aidan_OneDrive..onedrive_.path1.lst" ] || [ ! -f "$HOME/.cache/rclone/bisync/home_aidan_OneDrive..onedrive_.path2.lst" ]; then
  echo "Initial sync or listings missing, performing resync..." >> "$LOG_FILE"
  rclone bisync "$LOCAL_PATH" "$REMOTE" \
    --resync \
    --conflict-resolve newer \
    --max-delete 100 \
    --log-file="$LOG_FILE" \
    --log-level INFO
else
  # Try normal bisync first
  rclone bisync "$LOCAL_PATH" "$REMOTE" \
    --conflict-resolve newer \
    --max-delete 100 \
    --log-file="$LOG_FILE" \
    --log-level INFO

  # If it fails with exit code 7 (needs resync), run with resync
  if [ $? -eq 7 ]; then
    echo "Normal bisync failed, attempting resync..." >> "$LOG_FILE"
    rclone bisync "$LOCAL_PATH" "$REMOTE" \
      --resync \
      --conflict-resolve newer \
      --max-delete 100 \
      --log-file="$LOG_FILE" \
      --log-level INFO
  fi
fi
