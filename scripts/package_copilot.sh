#!/bin/bash

# Exit on any error
set -e

# Resolve absolute paths
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

HARNESS_DIR="$PROJECT_ROOT/harness"
STAGING_DIR="$PROJECT_ROOT/.copilot_staging"
COPILOT_DIR="$STAGING_DIR/.github"
ZIP_PATH="$PROJECT_ROOT/copilot.zip"

SUCCESS=false

cleanup() {
  # Disable trap to avoid recursion
  trap - EXIT

  if [ "$SUCCESS" = "false" ]; then
    echo "Error occurred. Cleaning up and rolling back..." >&2

    # Remove partial zip artifact if created
    if [ -f "$ZIP_PATH" ]; then
      rm -f "$ZIP_PATH" >/dev/null 2>&1
    fi

    # Remove the temporary staging folder if created
    if [ -d "$STAGING_DIR" ]; then
      rm -rf "$STAGING_DIR" >/dev/null 2>&1
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

if [ -d "$STAGING_DIR" ]; then
  echo "Error: staging directory '$STAGING_DIR' already exists. Please remove it first." >&2
  exit 1
fi

# 2. Create the staging directory and copy harness contents
mkdir -p "$COPILOT_DIR"

if [ -d "$HARNESS_DIR/skills" ]; then
  cp -a "$HARNESS_DIR/skills" "$COPILOT_DIR/"
fi

if [ -d "$HARNESS_DIR/templates" ]; then
  cp -a "$HARNESS_DIR/templates" "$COPILOT_DIR/"
fi

# 3. Concatenate rules into AGENTS.md
AGENTS_MD="$COPILOT_DIR/AGENTS.md"
echo "# Workspace rules" > "$AGENTS_MD"

if [ -d "$HARNESS_DIR/rules" ]; then
  for rule_file in "$HARNESS_DIR"/rules/*.md; do
    if [ -f "$rule_file" ]; then
      echo "" >> "$AGENTS_MD"
      awk '
        BEGIN { in_frontmatter = 0; dashes = 0 }
        /^---[[:space:]]*$/ {
          dashes++
          if (dashes == 1) { in_frontmatter = 1; next }
          if (dashes == 2) { in_frontmatter = 0; next }
        }
        {
          if (!in_frontmatter) {
            print
          }
        }
      ' "$rule_file" >> "$AGENTS_MD"
      echo "" >> "$AGENTS_MD"
    fi
  done
fi

# 4. Zip the .github folder (run from staging directory to keep relative paths correct)
cd "$STAGING_DIR"
zip -q -r "$ZIP_PATH" .github

# 5. Clean the temporary folders, only keeping the zip artifact
rm -rf "$STAGING_DIR"

# 6. Output the full path of the zip artifact to stdout
echo "$ZIP_PATH"

# Mark script as successful
SUCCESS=true
exit 0
