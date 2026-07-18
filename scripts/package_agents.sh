#!/bin/bash

# Exit on any error
set -e

# Resolve absolute paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

HARNESS_DIR="$PROJECT_ROOT/harness"
AGENTS_DIR="$PROJECT_ROOT/.agents"
TAR_PATH="$PROJECT_ROOT/agents.tar.gz"

SUCCESS=false

cleanup() {
  # Disable trap to avoid recursion
  trap - EXIT

  if [ "$SUCCESS" = "false" ]; then
    echo "Error occurred. Cleaning up and rolling back..." >&2

    # Remove partial tar.gz artifact if created
    if [ -f "$TAR_PATH" ]; then
      rm -f "$TAR_PATH" >/dev/null 2>&1
    fi

    # Remove the temporary .agents/ folder if created
    if [ -d "$AGENTS_DIR" ]; then
      rm -rf "$AGENTS_DIR" >/dev/null 2>&1
    fi

    exit 1
  fi
}

# Register cleanup on exit
trap cleanup EXIT

# 1. Verification of preconditions
if [ ! -d "$HARNESS_DIR" ]; then
  echo "Error: harness directory '$HARNESS_DIR' does not exist." >&2
  exit 1
fi

if [ -z "$(ls -A "$HARNESS_DIR")" ]; then
  echo "Error: harness directory '$HARNESS_DIR' is empty." >&2
  exit 1
fi

if [ -d "$AGENTS_DIR" ]; then
  echo "Error: .agents directory '$AGENTS_DIR' already exists. Please remove it first." >&2
  exit 1
fi

# 2. Create the .agents/ folder and copy harness contents
mkdir -p "$AGENTS_DIR"
cp -a "$HARNESS_DIR"/. "$AGENTS_DIR"/

# 3. Tar/gzip the .agents folder (run from project root to keep relative paths correct)
cd "$PROJECT_ROOT"
tar -czf "$TAR_PATH" .agents

# 4. Clean the temporary folders, only keeping the tar.gz artifact
rm -rf "$AGENTS_DIR"

# 5. Output the full path of the tar.gz artifact to stdout
echo "$TAR_PATH"

# Mark script as successful
SUCCESS=true
exit 0
