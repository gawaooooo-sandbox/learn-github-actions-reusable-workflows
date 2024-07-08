#!/usr/bin/env bash
set -xeu

echo "::group::Convert <pre> to <code> in Markdown files"

MARKDOWN_FILES=$1

markdown_files_str=$(echo "${MARKDOWN_FILES:-}" | jq -r '.[]')
mapfile -t markdown_files <<< "$markdown_files_str"

for markdown_file in "${markdown_files[@]}"; do
  sed -i 's/<pre>/<code>/g' "$markdown_file"
  sed -i 's#</pre>#</code>#g' "$markdown_file"
done

echo "::endgroup::"
