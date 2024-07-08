#!/usr/bin/env bash
set -xeu

echo "::group::Generate Documentation for Multiple Files"

YAML_FILES=$1
MARKDOWN_FILES=$2

# Use jq to parse the JSON array properly and remove unwanted characters
# yaml_files_str=$(echo "${YAML_FILES:-}" | jq -r '.[]')
# markdown_files_str=$(echo "${MARKDOWN_FILES:-}" | jq -r '.[]')

# カンマ区切りの文字列を配列に変換
IFS=',' read -r -a yaml_files <<< "$YAML_FILES"
IFS=',' read -r -a markdown_files <<< "$MARKDOWN_FILES"

echo "YAML files array:"
for file in "${yaml_files[@]}"; do
  echo "$file"
done

echo "Markdown files array:"
for file in "${markdown_files[@]}"; do
  echo "$file"
done

# # Convert newline-separated strings to arrays using mapfile
# mapfile -t yaml_files <<< "$yaml_files_str"
# mapfile -t markdown_files <<< "$markdown_files_str"

for index in "${!yaml_files[@]}"; do
  yaml_file=${yaml_files[index]}
  markdown_file=${markdown_files[index]}

  # Remove the extension from the YAML file name
  yaml_file_base=$(basename "$yaml_file" .yml)
  yaml_file_base=$(basename "$yaml_file_base" .yaml)

  # Check if the Markdown file exists, if not, create an empty file
  if [ ! -f "$markdown_file" ]; then
    mkdir -p "$(dirname "$markdown_file")"
    cat <<EOF > "$markdown_file"
---
title: ${yaml_file_base}
layout: default
---

# ${yaml_file_base}
{: .no_toc }

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

---

{% raw %}
<!-- actdocs start -->

<!-- actdocs end -->
{% endraw %}
EOF
  fi

  docker run --rm -v "$(pwd):/work" -w "/work" ghcr.io/tmknom/actdocs inject --omit --sort --file "$markdown_file" "$yaml_file"
done

echo "::endgroup::"
