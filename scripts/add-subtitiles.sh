# Pre Reqs!
# sudo pacman -S ffmpeg libass
# pip install -U openai-whisper

#!/bin/bash

# Usage: ./add-subtitles.sh path/to/video.mp4

# Exit on error
set -e

# Check for input
if [ -z "$1" ]; then
  echo "Usage: $0 video_filename"
  exit 1
fi

INPUT="$1"
BASENAME=$(basename "$INPUT" | sed 's/\.[^.]*$//') # strip extension
SRT_FILE="${BASENAME}.srt"
OUTPUT="${BASENAME}_subs.mp4"

# Step 1: Transcribe using Whisper
echo "📝 Transcribing $INPUT to English subtitles..."
whisper "$INPUT" --language English --task transcribe --output_format srt

# Step 2: Burn subtitles into video with FFmpeg
echo "🎞️ Burning subtitles into video..."
ffmpeg -y -i "$INPUT" -vf "subtitles=${SRT_FILE}" "$OUTPUT"

echo "✅ Done! Output video: $OUTPUT"
