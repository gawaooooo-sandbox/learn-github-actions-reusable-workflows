#!/usr/bin/env bash
set -xeu

echo "::group::Generate Documentation for Multiple Files"

YAML_FILES=$1
MARKDOWN_FILES=$2

# Use jq to parse the JSON array properly and remove unwanted characters
yaml_files_str=$(echo "${YAML_FILES:-}" | jq -r '.[]')
markdown_files_str=$(echo "${MARKDOWN_FILES:-}" | jq -r '.[]')

# Convert newline-separated strings to arrays using mapfile
mapfile -t yaml_files <<< "$yaml_files_str"
mapfile -t markdown_files <<< "$markdown_files_str"

for index in "${!yaml_files[@]}"; do
  yaml_file=${yaml_files[index]}
  markdown_file=${markdown_files[index]}

  # Check if the Markdown file exists, if not, create an empty file
  if [ ! -f "$markdown_file" ]; then
    mkdir -p "$(dirname "$markdown_file")"
    touch "$markdown_file"
  fi
  docker run --rm -v "$(pwd):/work" -w "/work" ghcr.io/tmknom/actdocs inject --sort --file "$markdown_file" "$yaml_file"
done

echo "::endgroup::"
